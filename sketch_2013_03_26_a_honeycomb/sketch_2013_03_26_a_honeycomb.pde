float s = 30;  //hexagon edge length

float ux;
float uy;
float vx;
float vy;
float tx;
float ty;

void setup() {
  size(512, 512);

  //matrix for translate, shear, scale 
  ux = 1 * s;
  uy = 0 * s;
  vx = cos(PI/3) * s;
  vy = sin(PI/3) * s;
  tx = width * 0.5;
  ty = height * 0.5;
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(2 / s);

  applyMatrix(ux, vx, tx, uy, vy, ty);

  int top = floor(-ty / vy);
  int bottom = ceil((height - ty) / vy);
  for (int y = top; y <= bottom; ++y) {
    int left = floor((-tx - vx * y) / ux);
    int right = ceil((width -tx - vx * y) / ux);
    //hexagon's center (x, y) accords with (x - y) % 3 == 0
    for (int x = left + (y - left) % 3 - 3; x <= right; x += 3) {
      //only draw the left and upper edges
      line(x, y + 1, x - 1, y + 1);
      line(x - 1, y + 1, x - 1, y);
      line(x - 1, y, x, y - 1);
    }
  }
  saveFrame("honeycomb.png");
  noLoop();
}

