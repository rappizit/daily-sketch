/**
@date 2013-03-25
http://www.learningprocessing.com/examples/chapter-15/example-15-15/
*/

PImage img;       // The source image
int cellsize = 2; // Dimensions of each cell in the grid
int cols, rows;   // Number of columns and rows in our system

void setup() {
  img  = loadImage("../res/sunflower.jpg"); // Load the image
  size(400, 400, P3D); 
  cols = img.width/cellsize;             // Calculate # of columns
  rows = img.height/cellsize;            // Calculate # of rows
}

void draw() {
  background(255);
  loadPixels();
  // Begin loop for rows
  for ( int j = 0; j < rows;j++) {
    // Begin loop for columns
    for ( int i = 0; i < cols;i++) {
      int x = i*cellsize + cellsize/2; // x position
      int y = j*cellsize + cellsize/2; // y position
      int loc = x + y*img.width;           // Pixel array location
      color c = img.pixels[loc];       // Grab the color
      // Calculate a z position as a function of mouseX and pixel brightness
      float z = (mouseX/(float)width) * brightness(img.pixels[loc]) - 100.0;
      // Translate to the location, set fill and stroke, and draw the rect
      pushMatrix();
      translate(x*width/img.width, y*height/img.height, z);
      fill(c);
      noStroke();
      rectMode(CENTER);
      rect(0, 0, cellsize*width/img.width, cellsize*height/img.height);
      popMatrix();
    }
  }
  
  if (mousePressed) {
    saveFrame("frame-####.png");
  }
}

