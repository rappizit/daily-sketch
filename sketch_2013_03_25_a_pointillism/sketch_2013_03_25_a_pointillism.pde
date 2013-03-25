/**
@date 2013-03-25
http://www.learningprocessing.com/examples/chapter-15/example-15-14/
*/

PImage img;
int pointillize = 16;
int mousePressTime = 0;
int frameTime;

void setup() {
  img = loadImage("../res/sunflower.jpg");
  size(800, 800);

  background(255);
  smooth();
  img.loadPixels();
}

void draw() {
  ++frameTime;
  
  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));

  // Allow mouse input once in every 30 frames;
  if (mousePressed) {
    if(mousePressTime < frameTime){
      mousePressTime = frameTime + 30;
      x = mouseX*img.width/width;
      y = mouseY*img.height/height;
    }
  }

  int loc = x + y*img.width;

  // Look up the RGB color in the source image
  //loadPixels();
  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();

  // Draw an ellipse at that location with that color
  fill(r, g, b, 100);
  ellipse(x*(width/img.width), y*(height/img.height), pointillize, pointillize);
  
  if(frameTime % 1000==0){
    saveFrame("pointillism-######.png");
  }
}

