;;;_* sage-mode.el --- Major mode for editing SAGE code

;; Copyright (C) 2007  Nick Alexander

;; Author: Nick Alexander <ncalexander@gmail.com>
;; Keywords: sage ipython python math

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:

;;; Code:

(require 'python)
(require 'comint)
(require 'ansi-color)
(require 'compile)

;;;_* Inferior SAGE major mode for interacting with a slave SAGE process

(defcustom inferior-sage-prompt (rx line-start (1+ (and (or "sage:" "....." ">>>" "...") " ")))
  "Regular expression matching the SAGE prompt."
  :group 'sage
  :type 'regexp)

(defcustom inferior-sage-timeout 500000
  "How long to wait for a SAGE prompt."
  :group 'sage
  :type 'integer)

(define-derived-mode
  inferior-sage-mode
  inferior-python-mode
  "Inferior SAGE"
  "Major mode for interacting with an inferior SAGE process."

  (setq comint-prompt-regexp inferior-sage-prompt)
  (setq comint-redirect-finished-regexp "sage:") ; comint-prompt-regexp)

  (setq comint-input-sender 'ipython-input-sender)
  ;; I type x? a lot
  (set 'comint-input-filter 'sage-input-filter)

  (make-local-variable 'compilation-error-regexp-alist)
  (make-local-variable 'compilation-error-regexp-alist-alist)
  (add-to-list 'compilation-error-regexp-alist-alist sage-test-compilation-regexp)
  (add-to-list 'compilation-error-regexp-alist 'sage-test-compilation)
  (add-to-list 'compilation-error-regexp-alist-alist sage-build-compilation-regexp)
  (add-to-list 'compilation-error-regexp-alist 'sage-build-compilation)

  (compilation-shell-minor-mode 1))

(defun inferior-sage-wait-for-prompt ()
  "Wait until the SAGE process is ready for input."
  (with-current-buffer sage-buffer
    (let* ((sprocess (get-buffer-process sage-buffer))
	    (success nil)
	    (timeout 0))
      (while (progn
	       (if (not (eq (process-status sprocess) 'run))
		   (error "SAGE process has died unexpectedly.")
		 (if (> (setq timeout (1+ timeout)) inferior-sage-timeout)
		     (error "Timeout waiting for SAGE prompt. Check inferior-sage-timeout."))
		 (accept-process-output nil 0 1)
		 (sit-for 0)
		 (goto-char (point-max))
		 (forward-line 0)
		 (setq success (looking-at inferior-sage-prompt))
		 (not (or success (looking-at ".*\\?\\s *"))))))
      (goto-char (point-max))
      success)))

(defun sage-input-filter (string)
  "A `comint-input-filter' that keeps all input in the history."
  t)

;;;_* IPython magic commands

(defcustom ipython-input-handle-magic-p t
  "Non-nil means handle IPython magic commands specially."
  :group 'ipython
  :type 'boolean)

(defvar ipython-input-string-is-magic-regexp
  "[^*?]\\(\\?\\??\\)\\'"
  "Regexp matching IPython magic input.

The first match group is used to dispatch handlers in
`ipython-input-handle-magic'.")

(defun ipython-input-string-is-magic-p (string)
  "Return non-nil if STRING is IPython magic."
  (string-match ipython-input-string-is-magic-regexp string))

(defvar ipython-input-magic-handlers '(("?"  . ipython-handle-magic-?)
				       ("??" . ipython-handle-magic-??))
  "Association list (STRING . FUNCTION) of IPython magic handlers.

Each FUNCTION should take arguments (PROC STRING MATCH) and
return non-nil if magic input was handled, nil if input should be
sent normally.")

(defun ipython-handle-magic-? (proc string &optional match)
  "Handle IPython magic ?."
  (when (string-match "\\(.*?\\)\\?" string)
    (ipython-describe-symbol (match-string 1 string))))

(defun ipython-handle-magic-?? (proc string &optional match)
  "Handle IPython magic ??."
  (when (string-match "\\(.*?\\)\\?\\?" string)
    (sage-find-symbol-other-window (match-string 1 string))))

(defun ipython-input-handle-magic (proc string)
  "Handle IPython magic input STRING in process PROC.

Return non-nil if input was handled; nil if input should be sent
normally."
  (when (string-match ipython-input-string-is-magic-regexp string)
    (let* ((match (match-string 1 string))
	   (handler (cdr (assoc match ipython-input-magic-handlers))))
      (when handler
	(condition-case ()
	    ;; I can't explain why, but this seems to work perfectly with ??
	    (save-excursion
	      (funcall handler proc string match))
	  ;; XXX print error message?
	  (error nil))))))

(defun ipython-input-sender (proc string)
  "Function for sending to process PROC input STRING.

When `ipython-input-handle-magic-p' is non-nil, this uses
`ipython-input-string-is-magic-p' to look for ipython magic
commands, such as %prun, etc, and magic suffixes, such as ? and
??, and handles them... magically?  It hands them off to
`ipython-input-handle-magic' for special treatment.

Otherwise, `comint-simple-send' just sends STRING plus a newline."
  (if (and ipython-input-handle-magic-p ; must want to handle magic
	       (ipython-input-string-is-magic-p string) ; ... be magic
	       (ipython-input-handle-magic proc string)) ; and be handled
      ;; To have just an input history creating, clearing new line entered
      (comint-simple-send proc "")
    (comint-simple-send proc string)))	; otherwise, you're sent

;;;_* SAGE process management

(defcustom sage-command (expand-file-name "~/bin/sage")
  "Actual command used to run SAGE.
Additional arguments are added when the command is used by `run-sage' et al."
  :group 'sage
  :type 'string)

(defcustom sage-startup-command "import sage.misc.sage_emacs as emacs"
  "Run this command each time SAGE slave is executed by `run-sage'."
  :group 'sage
  :type 'string)

(defvar sage-buffer nil
  "*The current SAGE process buffer.

Commands that send text from source buffers to SAGE processes have
to choose a process to send to.  This is determined by buffer-local
value of `sage-buffer'.  If its value in the current buffer,
i.e. both any local value and the default one, is nil, `run-sage'
and commands that send to the Python process will start a new process.

Whenever \\[run-sage] starts a new process, it resets the default
value of `sage-buffer' to be the new process's buffer and sets the
buffer-local value similarly if the current buffer is in SAGE mode
or Inferior SAGE mode, so that source buffer stays associated with a
specific sub-process.

Use \\[sage-set-proc] to set the default value from a buffer with a
local value.")
(make-variable-buffer-local 'sage-buffer)

;;;###autoload
(defun run-sage (&optional cmd noshow new)
  "Run an inferior SAGE process, input and output via buffer *SAGE*.
CMD is the SAGE command to run.  NOSHOW non-nil means don't show the
buffer automatically.

Normally, if there is a process already running in `sage-buffer',
switch to that buffer.  Interactively, a prefix arg allows you to edit
the initial command line (default is `sage-command'); `-i' etc. args
will be added to this as appropriate.  A new process is started if:
one isn't running attached to `sage-buffer', or interactively the
default `sage-command', or argument NEW is non-nil.  See also the
documentation for `sage-buffer'.

Runs the hook `inferior-sage-mode-hook' \(after the
`comint-mode-hook' is run).  \(Type \\[describe-mode] in the process
buffer for a list of commands.)"
  (interactive (if current-prefix-arg
		   (list (read-string "Run SAGE: " sage-command) nil t)
		 (list sage-command)))
  (unless cmd (setq cmd sage-command))
  (setq sage-command cmd)
  ;; Fixme: Consider making `sage-buffer' buffer-local as a buffer
  ;; (not a name) in SAGE buffers from which `run-sage' &c is
  ;; invoked.  Would support multiple processes better.
  (let ((create-new-sage-p
	 (or new			; if you ask for it
	     (null sage-buffer)		; or there isn't a running sage
	     (not (comint-check-proc sage-buffer)) ; or there is a sage
					; buffer, but it's dead
	     )))
    (when create-new-sage-p
      (with-current-buffer
	  (let* ((cmdlist (python-args-to-list cmd))
		 ;; Set PYTHONPATH to import module emacs from emacs.py,
		 ;; but ensure that a user specified PYTHONPATH will
		 ;; override our setting, so that emacs.py can be
		 ;; customized easily.
		 (orig-path (getenv "PYTHONPATH"))
		 (path-sep (if (and orig-path (length orig-path)) ":" ""))
		 (data-path (concat "PYTHONPATH=" orig-path path-sep data-directory))
		 (process-environment
		  (cons data-path process-environment)))
	    (apply 'make-comint-in-buffer "SAGE"
		   (if new (generate-new-buffer "*SAGE*") "*SAGE*")
		   (car cmdlist) nil (cdr cmdlist)))
	;; Show progress
	(unless noshow (pop-to-buffer (current-buffer)))
	;; Update default SAGE buffers
	(setq-default sage-buffer (current-buffer))
	;; Update python-buffer too, so that evaluation keys work
	(setq-default python-buffer (current-buffer))
	;; Set up sensible prompt defaults, etc
	(inferior-sage-mode)
	(when (inferior-sage-wait-for-prompt)
	  ;; Ensure we're at a prompt before loading the functions we use
	  ;; XXX: add more error-checking?
	  (sage-send-command sage-startup-command t)
	  (sage-find-current-branch)))))

  ;; If we're coming from a sage-mode buffer, update inferior buffer
  (when (derived-mode-p 'sage-mode)
      (setq sage-buffer (default-value 'sage-buffer)) ; buffer-local
      ;; Update python-buffer too, so that evaluation keys work
      (setq python-buffer (default-value 'sage-buffer))) ; buffer-local

  ;; No matter how we got here, we want this inferior buffer to be the master
  ;; (when (comint-check-proc sage-buffer)
  ;;  (setq-default sage-buffer sage-buffer)
  ;;  (setq-default python-buffer sage-buffer))
  ;; Without this, help output goes into the inferior python buffer if
  ;; the process isn't already running.
  ;; (sit-for 0)        ;Should we use accept-process-output instead?  --Stef
  (unless noshow (pop-to-buffer sage-buffer)))

(defun sage-find-current-branch ()
  (interactive)
  "Change the current SAGE buffer name to include the current branch."
  (save-excursion
    (point-max)
    (search-backward-regexp "Current Mercurial branch is: \\(.*\\)$")
    (when (match-string 1)
      (rename-uniquely (format "*SAGE-%s*" (match-string 1))))))

;;;_* SAGE major mode for editing SAGE library code

(provide 'sage)

(define-derived-mode
  sage-mode
  python-mode
  "SAGE"
  "Major mode for editing SAGE files."
)

;;;_* Treat SAGE code as Python source code

;;;###autoload
(add-to-list 'interpreter-mode-alist '("sage" . sage-mode))
;;;###autoload
(add-to-list 'auto-mode-alist '("\\.sage\\'" . sage-mode))
;;;###autoload
(add-to-list 'python-source-modes 'sage-mode)

;;;_* Integrate SAGE mode with Emacs

;;;_ + SAGE mode key bindings

;;;###autoload
(defun sage-bindings ()
  "Install SAGE bindings locally."
  (interactive)
  (local-set-key [(control c) (control t)] 'sage-test-file)
  (local-set-key [(control h) (control f)] 'ipython-describe-symbol)
  (local-set-key [(control h) (control g)] 'sage-find-symbol-other-window))

(add-hook 'sage-mode 'sage-bindings)
(add-hook 'inferior-sage-mode 'sage-bindings)

;;;_ + Set better grep defaults for SAGE and Pyrex code

(add-to-list 'grep-files-aliases '("py" . "{*.py,*.pyx}"))
(add-to-list 'grep-files-aliases '("pyx" . "{*.py,*.pyx}"))

;;;_ + Make devel/sage files play nicely, and don't jump into site-packages if possible

;;; It's annoying to get lost in sage/.../site-packages version of files when
;;; `sage-find-symbol' and friends jump to files.  It's even more annoying when
;;; the file is not correctly recognized as sage source!

(add-to-list 'auto-mode-alist '("devel/sage.*?\\.py\\'" . sage-mode))
(add-to-list 'auto-mode-alist '("devel/sage.*?\\.pyx\\'" . pyrex-mode))

(defvar sage-site-packages-regexp "\\(local.*?site-packages.*?\\)/sage"
  "Regexp to match sage site-packages files.

Match group 1 will be replaced with devel/sage-branch")

(add-hook 'find-file-hook 'sage-warn-if-site-packages-file)
(defun sage-warn-if-site-packages-file()
  "Warn if sage FILE is in site-packages and offer to find current branch version."
  (let ((f (buffer-file-name (current-buffer))))
    (and f (string-match sage-site-packages-regexp f)
         (if (y-or-n-p "This is a sage site-packages file, open the real file? ")
             (sage-jump-to-development-version)
           (push '(:propertize "SAGE-SITE-PACKAGES-FILE:" face font-lock-warning-face)
                 mode-line-buffer-identification)))))

(defun sage-development-version (filename)
  "If FILENAME is in site-packages, current branch version, else FILENAME."
  (save-match-data
    (let* ((match (string-match sage-site-packages-regexp filename)))
      (if (and filename match)
	  ;; handle current branch somewhat intelligiently
	  (let* ((base (concat (substring filename 0 (match-beginning 1)) "devel/"))
		 (branch (or (file-symlink-p (concat base "sage")) "sage")))
	    (concat base branch (substring filename (match-end 1))))
	filename))))
 
(defun sage-jump-to-development-version ()
  "Jump to current branch version of current FILE if we're in site-packages version."
  (interactive)
  (let ((filename (sage-development-version (buffer-file-name (current-buffer))))
	(maybe-buf (find-buffer-visiting filename)))
    (if maybe-buf (pop-to-buffer maybe-buf)
      (find-alternate-file filename))))

(defadvice compilation-find-file
  (before sage-compilation-find-file (marker filename directory &rest formats))
  "Always try to find compilation errors in FILENAME in the current branch version."
  (ad-set-arg 1 (sage-development-version filename)))
(ad-activate 'compilation-find-file)

;;;_ + Integrate with eshell

(defconst sage-test-compilation-regexp
  (list 'sage-test-compilation
	"^File \"\\(.*\\)\", line \\([0-9]+\\)"
	1
	2))

(defconst sage-build-compilation-regexp
  (list 'sage-build-compilation
	"^\\(.*\\):\\([0-9]+\\):\\([0-9]+\\):"
	1 2 3))

;; To add support for SAGE build and test errors to *compilation* buffers by
;; default, evaluate the following four lines.
;;
;; (add-to-list 'compilation-error-regexp-alist-alist sage-test-compilation-regexp)
;; (add-to-list 'compilation-error-regexp-alist 'sage-test-compilation)
;; (add-to-list 'compilation-error-regexp-alist-alist sage-build-compilation-regexp)
;; (add-to-list 'compilation-error-regexp-alist 'sage-build-compilation)

(defun eshell-sage-command-hook (command args)
  "Handle some SAGE invocations specially.

Without ARGS, run SAGE in an emacs `sage-mode' buffer.

With first ARGS starting with \"-b\" or \"-t\", run SAGE in an
emacs `compilation-mode' buffer.

Otherwise (for example, with ARGS \"-hg\", run SAGE at the eshell
prompt as normal.

This is an `eshell-named-command-hook' because only some parameters modify the
command; other times, it has to execute as a standard eshell command."
  (when (equal command "sage")
    (cond ((not args)
	   ;; run sage inside emacs
	   (run-sage sage-command nil t)
	   t)
	  ((member (substring (car args) 0 2) '("-t" "-b"))
	   ;; echo sage build into compilation buffer
	   (throw 'eshell-replace-command
		  (eshell-parse-command
		   "compile"
		   (cons "sage" (eshell-flatten-list args))))))))
(add-hook 'eshell-named-command-hook 'eshell-sage-command-hook)

;; From http://www.emacswiki.org/cgi-bin/wiki?EshellFunctions
(defun eshell/compile (&rest args)
  "Use `compile' to do background makes."
  (if (eshell-interactive-output-p)
      (let ((compilation-process-setup-function
	     (list 'lambda nil
		   (list 'setq 'process-environment
			 (list 'quote (eshell-copy-environment))))))
	(compile (eshell-flatten-and-stringify args))
	(pop-to-buffer compilation-last-buffer))
    (throw 'eshell-replace-command
	   (let ((l (eshell-stringify-list (eshell-flatten-list args))))
	     (eshell-parse-command (car l) (cdr l))))))
(put 'eshell/compile 'eshell-no-numeric-conversions t)

;;;_* Load relative modules correctly

(defun python-qualified-module-name (file)
  "Find the qualified module name for filename FILE.

This recurses down the directory tree as long as there are __init__.py
files there, signalling that we are inside a package.

Returns a pair (PACKAGE . MODULE).  The first is the top level
package directory; the second is the dotted Python module name.

Adapted from a patch posted to the python-mode trac."
  (let ((rec #'(lambda (d f)
		 (let* ((dir (file-name-directory d))
			(initpy (concat dir "__init__.py")))
		   (if (file-exists-p initpy)
		       (let ((d2 (directory-file-name d)))
			 (funcall rec (file-name-directory d2)
				  (concat (file-name-nondirectory d2) "." f)))
		     (list d f))))))
    (funcall rec (file-name-directory file)
	     (file-name-sans-extension (file-name-nondirectory file))))) 

;;; Replace original `python-load-file' to use xreload and packages.
(defadvice python-load-file
  (around nca-python-load-file first (file-name &optional no-xreload))
  "Load a Python file FILE-NAME into the inferior Python process.

Without prefix argument, use fancy new xreload. With prefix
argument, use default Python reload.

THIS REPLACES THE ORIGINAL `python-load-file'.

If the file has extension `.py' import or reload it as a module.
Treating it as a module keeps the global namespace clean, provides
function location information for debugging, and supports users of
module-qualified names."
  (interactive
   (append (comint-get-source
	    (format "%s Python file: " (if current-prefix-arg "reload" "xreload"))
	    python-prev-dir/file
	    python-source-modes
	    t)
	   current-prefix-arg))	; because execfile needs exact name
  (comint-check-source file-name)     ; Check to see if buffer needs saving.
  (setq python-prev-dir/file (cons (file-name-directory file-name)
				   (file-name-nondirectory file-name)))
  (with-current-buffer (process-buffer (python-proc)) ;Runs python if needed.
    ;; Fixme: I'm not convinced by this logic from python-mode.el.
    (python-send-command
     (if (string-match "\\.py\\'" file-name)
	 (let* ((directory-module (python-qualified-module-name file-name))
		(directory (car directory-module))
		(module (cdr directory-module))
		(xreload-flag (if no-xreload "False" "True")))
	   (format "emacs.eimport(%S, %S, use_xreload=%s)"
		   module directory xreload-flag))
       (format "execfile(%S)" file-name)))
    (message "%s loaded" file-name)))
(ad-activate 'python-load-file)

;;;_* Convenient *programmatic* Python interaction

(defvar python-default-tag-noerror "_XXX1XXX_NOERROR")
(defvar python-default-tag-error "_XXX1XXX_ERROR")

(defun python-protect-command (command &optional tag-noerror tag-error)
  "Wrap Python COMMAND in a try-except block and signal error conditions.

Print TAG-NOERROR on successful Python execution and TAG-ERROR on
error conditions."
  (let* ((tag-noerror (or tag-noerror python-default-tag-noerror))
	 (tag-error   (or tag-error   python-default-tag-error))
	 (lines (split-string command "\n"))
	 (indented-lines
	  (mapconcat (lambda (x) (concat "    " x)) lines "\n")))
    (format "try:
%s
    print %S,
except e:
    print e
    print %S,
" indented-lines tag-noerror tag-error)))

(defmacro with-python-output-to-buffer (buffer command &rest body)
  "Send COMMAND to inferior Python, redirect output to BUFFER, and execute
BODY in that buffer.

The value returned is the value of the last form in body.

Block while waiting for output."
  (declare (indent 2) (debug t))
  `(with-current-buffer ,buffer
     ;; Grab what Python has to say
     (comint-redirect-send-command-to-process
      (python-protect-command ,command)
      (current-buffer) (python-proc) nil t)
     ;; Wait for the redirection to complete
     (with-current-buffer (process-buffer (python-proc))
       (while (null comint-redirect-completed)
	 (accept-process-output nil 1)))
     (message (buffer-name))
     ;; Execute BODY
     ,@body
     ))

(defmacro with-python-output-buffer (command &rest body)
  "Send COMMAND to inferior Python and execute BODY in temp buffer with
  output.

The value returned is the value of the last form in body.

Block while waiting for output."
  (declare (indent 1) (debug t))
  `(with-temp-buffer
     (with-python-output-to-buffer (current-buffer) ,command
       ,@body)))

;; (with-python-output-to-buffer "*scratch*" "x?\x?"
;;   (message "%s" (buffer-name)))

(defun sage-send-command (command &optional echo-input)
  "Evaluate COMMAND in inferior Python process.

If ECHO-INPUT is non-nil, echo input in process buffer."
  (interactive "sCommand: ")
  (if echo-input
      (with-current-buffer (process-buffer (python-proc))
	;; Insert and evaluate input string in place
	(insert command)
	(comint-send-input nil t))
    (python-send-command command)))

(defun python-send-receive-to-buffer (command buffer &optional echo-output)
  "Send COMMAND to inferior Python (if any) and send output to BUFFER.

If ECHO-OUTPUT is non-nil, echo output to process buffer.

This is an alternate `python-send-receive' that uses temporary buffers and
`comint-redirect-send-command-to-process'.  Block while waiting for output.
This implementation handles multi-line output strings gracefully.  At this
time, it does not handle multi-line input strings at all."
  (interactive "sCommand: ")
  (with-current-buffer buffer
    ;; Grab what Python has to say
    (comint-redirect-send-command-to-process
     command (current-buffer) (python-proc) echo-output t)
    ;; Wait for the redirection to complete
    (with-current-buffer (process-buffer (python-proc))
      (while (null comint-redirect-completed)
	(accept-process-output nil 1)))))

(defun python-send-receive-multiline (command)
  "Send COMMAND to inferior Python (if any) and return result as a string.

This is an alternate `python-send-receive' that uses temporary buffers and
`comint-redirect-send-command-to-process'.  Block while waiting for output.
This implementation handles multi-line output strings gracefully.  At this
time, it does not handle multi-line input strings at all."
  (interactive "sCommand: ")
  (with-temp-buffer
    ;; Grab what Python has to say
    (comint-redirect-send-command-to-process
     command (current-buffer) (python-proc) nil t)
    ;; Wait for the redirection to complete
    (with-current-buffer (process-buffer (python-proc))
      (while (null comint-redirect-completed)
	(accept-process-output nil 1)))
    ;; Return the output
    (let ((output (buffer-substring-no-properties (point-min) (point-max))))
      (when (interactive-p)
	(message output))
      output)))

;;;_* Generally useful tidbits

(defun python-current-word ()
  "Return python symbol at point."
  (with-syntax-table python-dotty-syntax-table
    (current-word)))

;;;_* IPython and SAGE completing reads

;;;_ + `ipython-completing-read-symbol' is `completing-read' for python symbols
;;; using IPython's *? mechanism

(defvar ipython-completing-read-symbol-history ()
  "List of Python symbols recently queried.")

(defvar ipython-completing-read-symbol-pred nil
  "Default predicate for filtering queried Python symbols.")

(defvar ipython-completing-read-symbol-command "%s*?"
  "IPython command for generating completions.
Each completion should appear separated by whitespace.")

(defvar ipython-completing-read-symbol-cache ()
  "A pair (LAST-QUERIED-STRING . COMPLETIONS).")

(defun ipython-completing-read-symbol-clear-cache ()
  "Clear the IPython completing read cache."
  (interactive)
  (setq ipython-completing-read-symbol-cache ()))

(defun ipython-completing-read-symbol-make-completions (string)
  "Query IPython for completions of STRING.

Return a list of completion strings.
Uses `ipython-completing-read-symbol-command' to query IPython."
  (let* ((command (format ipython-completing-read-symbol-command string))
	 (output (python-send-receive-multiline command)))
    (condition-case ()
	(split-string output)
      (error nil))))

(defun ipython-completing-read-symbol-function (string predicate action)
  "A `completing-read' programmable completion function for querying IPython.

See `try-completion' and `all-completions' for interface details."
  (let ((cached-string (car ipython-completing-read-symbol-cache))
	(completions (cdr ipython-completing-read-symbol-cache)))
    ;; Recompute table using IPython if neccessary
    (when (or (null completions)
	      (not (equal string cached-string)))
      (setq ipython-completing-read-symbol-cache
	    (cons string (ipython-completing-read-symbol-make-completions string)))
      (setq completions
	    (cdr ipython-completing-read-symbol-cache)))
    ;; Complete as necessary
    (cond 
      ((eq action 'lambda) (test-completion string completions)) ; 'lambda
      (action (all-completions string completions predicate))	 ; t
      (t (try-completion string completions predicate)))))	 ; nil

(defun ipython-completing-read-symbol
  (&optional prompt def require-match predicate)
  "Read a Python symbol (default: DEF) from user, completing with IPython.

Return a single element list, suitable for use in `interactive' forms.
PROMPT is the prompt to display, without colon or space.
If DEF is nil, default is `python-current-word'.
PREDICATE returns non-nil for potential completions.
See `completing-read' for REQUIRE-MATCH."
  (let* ((default (or def (python-current-word)))
	 (prompt (if (null default) (concat prompt ": ")
		   (concat prompt (format " (default %s): " default))))
	 (func 'ipython-completing-read-symbol-function)
	 (pred (or predicate ipython-completing-read-symbol-pred))
	 (hist 'ipython-completing-read-symbol-history)
	 (enable-recursive-minibuffers t))
    (ipython-completing-read-symbol-clear-cache)
    (list (completing-read prompt func pred require-match nil hist default))))

;;; `ipython-describe-symbol' is `find-function' for python symbols using
;;; IPython's ? magic mechanism.

(defvar ipython-describe-symbol-not-found-regexp "Object `.*?` not found."
  "Regexp that matches IPython's 'symbol not found' warning.")

(defvar ipython-describe-symbol-command "%s?")

(defvar ipython-describe-symbol-temp-buffer-show-hook
  (lambda ()				; avoid xref stuff
    (toggle-read-only 1)
    (setq view-return-to-alist
	  (list (cons (selected-window) help-return-method))))
  "`temp-buffer-show-hook' installed for `ipython-describe-symbol' output.")

(defun ipython-describe-symbol-markup-function (string)
  "Markup IPython's inspection (?) for display."
  (when (string-match "[ \t\n]+\\'" string)
    (concat (substring string 0 (match-beginning 0)) "\n")))

(defun ipython-describe-symbol (symbol)
  "Get help on SYMBOL using IPython's inspection (?).
Interactively, prompt for SYMBOL."
  ;; Note that we do this in the inferior process, not a separate one, to
  ;; ensure the environment is appropriate.
  (interactive (ipython-completing-read-symbol "Describe symbol" nil t))
  (when (or (null symbol) (equal "" symbol))
    (error "No symbol"))
  (let* ((command (format ipython-describe-symbol-command symbol))
	 (raw-contents (python-send-receive-multiline command))
	 (help-contents
	  (or (ipython-describe-symbol-markup-function raw-contents)
	      raw-contents))
	 (temp-buffer-show-hook ipython-describe-symbol-temp-buffer-show-hook))
    ;; XXX Handle exceptions; perhaps (with-python-output ...) or similar
    ;; Handle symbol not found gracefully  
    (when (string-match ipython-describe-symbol-not-found-regexp raw-contents)
      (error "Symbol not found"))
    (when (= 0 (length help-contents))
      (error "Symbol has no description"))
    ;; Ensure we have a suitable help buffer.
    (with-output-to-temp-buffer (help-buffer)
      (with-current-buffer standard-output
	;; Fixme: Is this actually useful?
	(help-setup-xref (list 'ipython-describe-symbol symbol) (interactive-p))
	(set (make-local-variable 'comint-redirect-subvert-readonly) t)
	(print-help-return-message)
	;; Finally, display help contents
	(princ help-contents)))))

;;;_ + `sage-find-symbol' is `find-function' for SAGE.

(defun sage-find-symbol-command (symbol)
  "Return SAGE command to fetch position of SYMBOL."
  (format
   (concat "sage.misc.sageinspect.sage_getfile(%s), "
	   "sage.misc.sageinspect.sage_getsourcelines(%s)[-1] + 1")
   symbol symbol))

(defvar sage-find-symbol-regexp "('\\(.*?\\)',[ \t\n]+\\([0-9]+\\))"
  "Match (FILENAME . LINE) from `sage-find-symbol-command'.")

(defun sage-find-symbol-noselect (symbol)
  "Return a pair (BUFFER . POINT) pointing to the definition of SYMBOL.

Queries SAGE to find the source file containing the definition of
FUNCTION in a buffer and the point of the definition.  The buffer
is not selected.

At this time, there is no error checking.  Later, if the function
definition can't be found in the buffer, returns (BUFFER)."
  (when (not symbol)
    (error "You didn't specify a symbol"))
  (let* ((command (sage-find-symbol-command symbol))
	 (raw-contents (python-send-receive-multiline command)))
    (unless (string-match sage-find-symbol-regexp raw-contents)
      (error "Symbol source not found"))
    (let* ((raw-filename (match-string 1 raw-contents))
	   (filename (sage-development-version raw-filename))
	   (line-num (string-to-number (match-string 2 raw-contents))))
      (with-current-buffer (find-file-noselect filename)
	(goto-line line-num) ; XXX error checking?
	(cons (current-buffer) (point))))))

(defun sage-find-symbol-do-it (symbol switch-fn)
  "Find definition of SYMBOL in a buffer and display it.

SWITCH-FN is the function to call to display and select the
buffer."
      (let* ((orig-point (point))
	     (orig-buf (window-buffer))
	     (orig-buffers (buffer-list))
	     (buffer-point (save-excursion
			     (sage-find-symbol-noselect symbol)))
	     (new-buf (car buffer-point))
	     (new-point (cdr buffer-point)))
	(when buffer-point
	  (when (memq new-buf orig-buffers)
	    (push-mark orig-point))
	  (funcall switch-fn new-buf)
	  (when new-point (goto-char new-point))
	  (recenter find-function-recenter-line)
	  ;; (run-hooks 'find-function-after-hook)
	  t)))

;;;###autoload
(defun sage-find-symbol (symbol)
  "Find the definition of the SYMBOL near point.

Finds the source file containing the defintion of the SYMBOL near point and
places point before the definition.
Set mark before moving, if the buffer already existed."
  (interactive (ipython-completing-read-symbol "Find symbol" nil t))
  (when (or (null symbol) (equal "" symbol))
    (error "No symbol"))
  (sage-find-symbol-do-it symbol 'switch-to-buffer))

;;;###autoload
(defun sage-find-symbol-other-window (symbol)
  "Find, in another window, the definition of SYMBOL near point.

See `sage-find-symbol' for details."
  (interactive (ipython-completing-read-symbol "Find symbol" nil t))
  (when (or (null symbol) (equal "" symbol))
    (error "No symbol"))
  (sage-find-symbol-do-it symbol 'switch-to-buffer-other-window))

;;;###autoload
(defun sage-find-symbol-other-frame (symbol)
  "Find, in another frame, the definition of SYMBOL near point.

See `sage-find-symbol' for details."
  (interactive (ipython-completing-read-symbol "Find symbol" nil t))
  (when (or (null symbol) (equal "" symbol))
    (error "No symbol"))
  (sage-find-symbol-do-it symbol 'switch-to-buffer-other-frame))

;;;_* Make it easy to sagetest files and methods

(defun sage-test-file-inline (file-name &optional method)
  "Run sage-test on file FILE-NAME, with output to underlying the SAGE buffer.

We take pains to test the correct module.

If METHOD is non-nil, try to test only the single method named METHOD.
Interactively, try to find current method at point."
  (interactive
   (append
    (comint-get-source "Load SAGE file: "
		       python-prev-dir/file python-source-modes t))
   (list current-prefix-arg))
  (comint-check-source file-name)     ; Check to see if buffer needs saving.
  (setq python-prev-dir/file (cons (file-name-directory file-name)
				   (file-name-nondirectory file-name)))
  (let* ((directory-module (python-qualified-module-name file-name))
	 (directory (car directory-module))
	 (module (cdr directory-module))
	 (command (format "sage.misc.sagetest.sagetest(%s)" module)))
    (sage-send-command command nil)))

(defun sage-test-file-to-buffer (file-name &optional method)
  "Run sage-test on file FILE-NAME, with output to a new buffer.

We take pains to test the correct module.

If METHOD is non-nil, try to test only the single method named METHOD.
Interactively, try to find current method at point."
  (interactive
   (append
    (comint-get-source "Load SAGE file: "
		       python-prev-dir/file python-source-modes t))
   (list current-prefix-arg))
  (comint-check-source file-name)     ; Check to see if buffer needs saving.
  (setq python-prev-dir/file (cons (file-name-directory file-name)
				   (file-name-nondirectory file-name)))
  (let* ((directory-module (python-qualified-module-name file-name))
	 (directory (car directory-module))
	 (module (cdr directory-module))
	 (command (format "sage.misc.sagetest.sagetest(%s)" module))
	 (compilation-error-regexp-alist '(sage-test sage-build)))
    (with-temp-buffer 
      (compile (eshell-flatten-and-stringify args))
      (python-send-receive-to-buffer command (current-buffer)))))

(defvar sage-test-file 'sage-test-file-to-buffer)
