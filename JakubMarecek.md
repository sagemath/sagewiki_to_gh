##master-page:HomepageTemplate
#format wiki
== Jakub Marecek ==
My personal homepage proper is at http://cs.nott.ac.uk/~jxm. This is just SAGE Days related stuff:

'''Graphical Demo of Integer Programming: '''

My goal was to present the workings of an integer programming solver in an interactive Java Web Start.

attachment:Screenshot01.jpg

attachment:Screenshot02.jpg

'''Installing VTK with Java Wrappers: '''

 * Download VTK sources and ccmake.
 * Even the latest stable version of VTK (5.0.4) makes some weird assumptions about namespaces. In order to make it compile with GCC 4.3, replace #include <string> with  #include <string.h> in all cxx files -- and similarly for other C library headers.
 * Add vtk.jar to your classpath. Notice the jar file can end up in a fresh /VTK-build/, even though you have specified other build output directory.
 * Add the directory where libvtkRenderingJava.so resides to your path. Export to PATH seems to work just as well as -Djava.library.path=~/VTK-build/bin/ at java's command line.
 * Add libmawt.so to you LD_LIBRARY_PATH in your environment. Export seems to work, although -DLD_LIBRARY_PATH at java's command line does not.
'''SVG and PDF Output for JyScript. '''

 * This should be a quick hack using Apache Batik (http://xmlgraphics.apache.org/batik/). Replace the standard Graphics2D with the Graphics2D from Batik to get SVG export.
{{{
import org.w3c.dom.Element;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.svg.SVGDocument;
import org.apache.batik.swing.JSVGCanvas;
import org.apache.batik.svggen.SVGGraphics2D;
import org.apache.batik.dom.svg.SVGDOMImplementation;
import org.apache.batik.transcoder.TranscoderInput;
import org.apache.batik.transcoder.TranscoderOutput;
import org.apache.fop.svg.PDFTranscoder;
public class Demo extends Applet {
 /* ... */
 public static void export() {
   DOMImplementation impl = SVGDOMImplementation.getDOMImplementation();
   String svgNS = SVGDOMImplementation.SVG_NAMESPACE_URI;
   SVGDocument doc = (SVGDocument)impl.createDocument(svgNS, "svg", null);
   SVGGraphics2D g = new SVGGraphics2D(doc);
   /* Here use can use g as if it was the usual canvas */
   /* Here we make it visible */
   Element root = doc.getDocumentElement();
   g.getRoot(root);
   JSVGCanvas canvas = new JSVGCanvas();
   JFrame f = new JFrame();
   f.getContentPane().add(canvas);
   canvas.setSVGDocument(doc);
   f.pack();
   f.setVisible(true);
   /* Here we produce the PDF */
   try {
     PDFTranscoder pdfTranscoder = new PDFTranscoder();
     TranscoderInput tIn = new TranscoderInput(doc);
     FileOutputStream fileOut = new FileOutputStream("test.pdf");
     TranscoderOutput tOut = new TranscoderOutput(fileOut); pdfTranscoder.transcode(tIn, tOut); fileOut.flush(); fileOut.close();
    } catch(Exception e) {e.printStackTrace();}
 }
}}}
'''TeX and PS and PDF Output for SAGE plot3s '''

 * This could perhaps be done using Sketch (http://www.frontiernet.net/~eugene.ressler/). It implements the painter's algorithm (z-buffering) with polygon splitting, and hence it should be just the output of triangles in the right format it takes. Nils (http://www.cecm.sfu.ca/~nbruin) now got that to work, sortof:
