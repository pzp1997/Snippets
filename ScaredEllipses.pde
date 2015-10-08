final int ROWS = 10;
final int COLS = 10;
final float INTENSE = 1.25;

int ellipseWidth, ellipseHeight;
int ellipseX, ellipseY;
float mouseProx;

void setup() {
  size(400, 400);
  noStroke();
  fill(0, 0, 170);
  
  ellipseWidth = width/COLS;
  ellipseHeight = height/ROWS;
}

void draw() {
  background(255);
  for (int i = 0; i < ROWS; i++) {
    for (int j = 0; j < COLS; j++) {
      ellipseX = j*(ellipseWidth) + ellipseWidth/2;
      ellipseY = i*(ellipseHeight) + ellipseHeight/2;
      mouseProx = dist(mouseX, mouseY, ellipseX, ellipseY) * INTENSE;
      ellipse(ellipseX, ellipseY,
              map(mouseProx, 0, width, 0, ellipseWidth),
              map(mouseProx, 0, height, 0, ellipseHeight));
    }
  }
}
