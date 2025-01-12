
![days90/Sagedays90.jpg](days90/Sagedays90.jpg) 


## Target Audience

This conference is aimed at women at all career stages who are interested in using or developing for Sage.  Undergraduate, graduate, postdoc, and faculty are welcome to apply. We will take time at the workshop to teach the basics of Sage development; it is not required that you are an experienced developer.  We are especially hoping to include women who have never attended <a href="/SageDays">SageDays</a>. Applications are now closed.   


## Schedule:

The schedule with room numbers can be found <a class="https" href="https://docs.google.com/spreadsheets/d/1kgkYBd40PuZ6-Rs-50s2nWTkji2AjcUOSOtbtoJC3cE/edit#gid=0">here</a>. 

* Saturday, October 21: Participants arrive in Claremont, CA in the evening. 
* Sunday, October 22: Workshop begins in the morning. 
* Monday, October 23:  
* Tuesday, October 24: Afternoon excursion and BBQ at Bianca's house.  
* Wednesday, October 25: Workshop ends in the evening.  
![days90/SageDays90Photo.jpg](days90/SageDays90Photo.jpg) 


## Projects

* **Number Theory and Arithmetic Dynamics**<a class="https" href="https://www.hmc.edu/mathematics/people/faculty/bianca-thompson/">Bianca Thompson</a> (Harvey Mudd College) <a href="days90/Number Theory and Arithmetic Dynamics">Number Theory and Arithmetic Dynamics</a>  
   * <a class="https" href="https://www.lifebynumber.org">Rebecca Lauren Miller</a>  
   * Zoe Bell 
   * Karina Cho 
* **Graph Theory**<a class="https" href="https://www.carroll.edu/faculty/amanda-francis">Amanda Francis</a> (Carroll College) <a href="days90/Graph Theory">Graph Theory</a>  
   * Caitlin Lienkaemper 
   * Kate Collins Wish List: 
   * Maximum Common Neighbors Matrix/Score 
         * - (optional: add weighted variants, co-citation/co-reference for digraphs) 
   * Preferential Attachment  
   * Katz Matrix/Score  
         * - (optional: Weighted Katz Score) 
   * Effective Resistance Matrix/Score 
   * Network Transformations: Series, Parallel, Delta-Y, Y-Delta 
         * - (optional: Mesh-Star, Star-Mesh) 
Amanda worked on implementing common-neighbors and effective resistance methods (<a class="https" href="https://trac.sagemath.org/ticket/24089">#24089</a> and <a class="https" href="https://trac.sagemath.org/ticket/24094">#24094</a>, both need small fixes).  Caitlyn worked on implementing Katz similarity and Katz centrality methods (<a class="https" href="https://trac.sagemath.org/ticket/24101">#24101</a>, new... still working on it).  Kate worked on implementing network transformations (<a class="https" href="https://trac.sagemath.org/ticket/24100">#24100</a> new... still working on it).   Series transformation is nearly done.  The others are still in progress.  

* **Linear Algebra**<a class="https" href="https://www.math.ucsd.edu/~alina/">Alina Bucur</a> (UCSD) 
   * Renata Paramastri 
   * Caitlin Lienkaemper 
   * Manami Roy 
Renata dealt with two of the tickets, <a class="https" href="https://trac.sagemath.org/ticket/22073">#22073</a> and <a class="https" href="https://trac.sagemath.org/ticket/20439">#20439</a>. At the moment the first one has a positive review and the second needs_work.  Wish list:  

   * IMA (or other place) workshop to fix linear algebra. For instance I agree with @kedlaya that dealing with <a class="https" href="https://trac.sagemath.org/ticket/9888">#9888</a> requires reorganizing the `matrix` directory. On second thought, a whole workshop might be needed just to fix just linear algebra over Z/NZ. See meta-ticket <a class="https" href="https://trac.sagemath.org/ticket/19076">#19076</a>.  
* **Local-to-Global Algorithms in Number Theory**<a class="http" href="http://www.mathcs.duq.edu/~haensch/">Anna Haensch</a> (Duquesne University) <a href="days90/Algorithms">Algorithms</a>  
   * Juanita Duque  
   * Manami Roy  
   * Sandi Rudzinski  Wish List: 
   * Implement Algorithm 3.4.1 for Q 
   * Implement Algorithm 3.4.3 for Q 
   * Extend to Number Fields 
   * Something about p-adic completions of a number field 
Anna's team opened two tickets (<a class="https" href="https://trac.sagemath.org/ticket/24098">#24098</a>,<a class="https" href="https://trac.sagemath.org/ticket/24108">#24108</a>) the first implementing algorithm 3.4.1, the second implementing 3.4.3, both over the rationals.  Ticket <a class="https" href="https://trac.sagemath.org/ticket/24098">#24098</a> needs review.  Team members also reviewed several tickets on trac.  


## Tickets

Please add #sd90 to any tickets you are working on on trac.  If your ticket needs review, added it to the list on the tickets page to advertise. 

* <a href="/sd90tickets">sd90tickets</a> 

## Accommodations:

* AirBnB accommodations in Claremont will be arranged for non-local participants. All workshop activities will take place on campus at Harvey Mudd College.  

## Travel:

* The closest airport to Claremont is the Ontario International California Airport (ONT).  From here it's a 10 mile taxi ride to Claremont.  
* Another option is to fly into Los Angeles International Airport (LAX).  From here you can take a <a class="https" href="https://www.supershuttle.com">SuperShuttle</a> to Claremont, $55 each way.  
* For other options, see the <a class="https" href="https://www.hmc.edu/about-hmc/visit-campus/">Visit Campus</a> page of the Harvey Mudd College Website. 

## The k8s server

William Stein has kindly provided a server for us to use during the workshop, with 48 CPUs and 256 GB of RAM.  It is running CoCalc, so you can access it from your browser. 


### Creating an Account

You should create an account <a class="https" href="https://k8s.sagemath.org/settings">here</a>.  You will need a secret token, which will be e-mailed to participants (ask Ursula Whitcher (<a href="mailto:uaw@umich.edu">uaw@umich.edu</a>) if you can't find it).  Once you have an account, someone will have to add you to the Sage Days 90 project; anyone who is already part of the project can do so from the project settings page.  At that point, you will be able to access the server at <a class="https" href="https://k8s.sagemath.org">k8s.sagemath.org</a>. 


### Git

If you will be doing Sage development, you need to set up a terminal that knows who you are (since we're all using the same user when we log in from the browser).  This way we will be able to share Sage installations on the server. 

If you provided your trac username to Ursula Whitcher (<a href="mailto:uaw@umich.edu">uaw@umich.edu</a>), the setup has been done for you.  Otherwise, open up a terminal (`~/Terms/Admin.term` exists for this purpose) and run the script `setup_user` (from anywhere).  This will ask you some questions (name, e-mail, trac account info) and create a terminal for you (`~/Terms/$TRAC_USERNAME.term`).  If you're ever interacting with git, you should use this terminal (or the ssh method described below) so that git knows who you are. 


### Trac Passwords

You have the option of storing your trac password (in a plain text file on the server, so don't do so if your trac password is sensitive).  You can control how your trac password is handled by the scripts `set_trac_password` and `unset_trac_password` from your terminal.  If you don't store your trac password in a file, you will be prompted for it when you open your terminal. 


### Editor

When you make a git commit, you can specify the commit message on the command line with the `-m` flag.  Otherwise, git will open an editor for you to enter the commit message.  The default editor is `vim`.  If you would rather use a different editor (such as `emacs`), you can set your editor by running the `set_editor` script in your terminal. 


### Updating Sage to 8.1.beta9

To update your version of Sage on k8s, type in your term: 

`git checkout develop` 

`git pull --ff-only trac develop` 

`make build` 


### SSH


#### SSHing into the project

Instead of using the browser, you can also SSH into the project and work in a terminal on your laptop. 

Once you add the public key _from your laptop_ (generated by `ssh-keygen` and then copied from `~/.ssh/id_rsa.pub` for example) to `~/authorized_keys` _in the browser_, you will be able to SSH into the project using the following command. 

`ssh XXX@k8s-ssh.sagemath.org -p 2222` 

At the beginning of your key in `~/authorized_keys` on the server you should add `command=".init_user roed" ` for example.  You can look at the other keys there for examples. 


#### Setting up SSH keys for trac

If you want to be able to push changes to trac, you need to upload your key from the k8s server to <a class="https" href="https://trac.sagemath.org/prefs/sshkeys">trac</a>.  You can find your ssh key by running `show_ssh_key` in your terminal. 


### Sage installations

If you provided your trac username to Ursula Whitcher (<a href="mailto:uaw@umich.edu">uaw@umich.edu</a>), you should have a Sage install in `~/Src`.  If not, you can create a new Sage installation for yourself by running 
```txt
new_sage
```
at your command prompt, or `new_sage $YOUR_TRAC_USERNAME` at any prompt (replacing `$YOUR_TRAC_USERNAME` with your trac username.  Note that this will take some time, since it must build Sage (though the build runs in parallel and doesn't need to build spkgs). 

The setup described above also means that the `sage` command in your terminal will be aliased to your copy of Sage. 


### Building and Large output

Avoid sending huge amounts of output in a terminal, as this slows the whole project down for everybody (proper output truncation isn’t sufficiently implemented).  Here are some options to avoid this. 

1. When building Sage, you can do 
```txt
./sage -b > output 2>&1
```
rather than just sending a large amount of output to your terminal.  You can check on output by typing 
```txt
tail output
```
2. If you know tmux, do control+b, then c to make a new session, and leave the large-output session in a different session.  You can switch back and forth with control+b then n. 

3. If you've set up your terminal as described above, then 
```txt
make build
```
in your sage folder will do the redirection for you, as well as automatically use many threads (so that the build goes much faster). 


## Some Guides For Getting Started With SAGE

* Download <a class="http" href="http://www.sagemath.org/download-source.html">SAGE source code</a>.  
* Install SAGE from source code using the <a class="http" href="http://doc.sagemath.org/html/en/installation/source.html">SAGE Installation Guide</a> (this may take several hours). 
* While you wait for SAGE to build, take a moment to <a class="http" href="http://doc.sagemath.org/html/en/developer/trac.html#section-trac-account">obtain a SAGEtrac account</a>.  
* Install and configure Git using the <a class="http" href="http://doc.sagemath.org/html/en/developer/index.html">SAGE Developer's Guide</a>.  

## Mailing Lists and Resources

* <a class="http" href="http://www2004.lsoft.se/scripts/wl.exe?SL1=WINN-L&amp;H=LISTS.HAWAII.EDU">Women in Numbers</a> 
* <a class="https" href="https://groups.google.com/forum/#!forum/sage-diversity">sage-diversity mailing list</a>   

## Organizers:

* Aly Deines (La Jolla, CA) 
* Anna Haensch (Duquesne University) 
* Bianca Thompson (Harvey Mudd College) 
* Ursula Whitcher (AMS Mathematical Reviews) 


---

 
