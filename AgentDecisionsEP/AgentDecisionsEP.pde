//pdf
import processing.pdf.*;

//pause draw
boolean pause=false;

//dimension screen
int w=800;
int h=800;

//track color
//check pixel color and track Positions from image.
int count =0;
//image
PImage img;
// color to track, white
color white = color(255, 255, 255); 
// steps
int step=5;
//saving the positions of the tracked color;
int nr=4000;
float [] trackX= new float[nr];
float [] trackY= new float[nr];

agentes[] agent = new agentes[4000];

void setup () {
  frameRate(25);
  size(w, h);
  smooth();
  // here you can change the original picture (you must put it in the folder /data
  img = loadImage("agent03.jpg");
  fill(0);
  background(255);
  checkPixel();
  // creating the particles
  for (int i = 0; i < agent.length; i++) {
    agent[i] = new agentes(trackX[i], trackY[i]);
  }
  //MAKE PDF (so I can have a vectorial file with the final draw
 // beginRecord(PDF, "frame-####.pdf");
}
void draw() {


  if (!pause) {
    for (int i = 0; i < count; i++) {

      agent[i].update();
      agent[i].display();
    }
  }
}

//Loocking for black pixels on the screen and given info to the inicial posicion of the particles
void checkPixel() {

  loadPixels();
  img.loadPixels();
  for (int y = 0; y < h; y=y+step ) {
    for (int x = 0; x < w; x=x+step ) {
      int loc = x + y*w;
      color pixelColor= img.pixels[loc];
      if (red(img.pixels [loc])==0 && count<nr) 
      {
        // println(x+" "+y+" "+count);
        trackX[count]=x;
        trackY[count]=y;
        count++;
      }
      // Set the display pixel to the image pixel
      pixels[loc] = pixelColor;
    }
  }
  for (int i=0;i<count;i++) 
  {
    stroke(30);
  }

  for (int i=0;i<count;i++) 
  {

    stroke(0);
    point(trackX[i], trackY[i]);
  }
}

////////////////////////////
//define keys
void keyPressed () {
  // hit p to pause
  if ( key == 'p' || key == 'P') { 
    pause=!pause;
  }
  // hit Q to save a PDF vector  (this will be saved in the project folder  
  if ( key == 'q' || key == 'Q') {
    printPDF();
  }
}

void printPDF() {
  endRecord();
}

