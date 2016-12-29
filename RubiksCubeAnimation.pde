int boxSize = 200;
float halfSize = boxSize / 2;
float sixthSize = boxSize / 6;
float a = 0;

color RED     = color(255, 0, 0);
color ORANGE  = color(255, 128, 0);
color YELLOW  = color(255, 255, 0);
color GREEN   = color(0, 255, 0);
color BLUE    = color(0, 0, 255);
color WHITE   = color(255);
color BLACK   = color(0);
color GREY    = color(128);

void setup() {
  size(500, 500, P3D);
  rectMode(CENTER);
  strokeWeight(3);
}

void draw() {
  background(GREY);
  translate(width/2, height/2);
  rotateX(a * 0.7);
  rotateY(a * 0.2);
  rotateZ(a * 0.3);
  a += 0.01;
  
  pushMatrix();
  translate(-halfSize, 0, 0);
  fill(RED);
  box(1, boxSize, boxSize); 
  translate(-1, 0, 0);
  fill(BLACK);
  line(0, -halfSize, -sixthSize, 0, halfSize, -sixthSize);
  line(0, -halfSize, sixthSize, 0, halfSize, sixthSize);
  line(0, -sixthSize, -halfSize, 0, -sixthSize, halfSize);
  line(0, sixthSize, -halfSize, 0, sixthSize, halfSize);
  popMatrix();
  
  pushMatrix();
  translate(halfSize, 0, 0);
  fill(ORANGE);
  box(1, boxSize, boxSize);
  translate(1, 0, 0);
  fill(BLACK);
  line(0, -halfSize, -sixthSize, 0, halfSize, -sixthSize);
  line(0, -halfSize, sixthSize, 0, halfSize, sixthSize);
  line(0, -sixthSize, -halfSize, 0, -sixthSize, halfSize);
  line(0, sixthSize, -halfSize, 0, sixthSize, halfSize);
  popMatrix();
  
  pushMatrix();
  translate(0, -halfSize, 0);
  fill(GREEN);
  box(boxSize, 1, boxSize);
  translate(0, -1, 0);
  fill(BLACK);
  line(-halfSize, 0, -sixthSize, halfSize, 0, -sixthSize);
  line(-halfSize, 0, sixthSize, halfSize, 0, sixthSize);
  line(-sixthSize, 0, -halfSize, -sixthSize, 0, halfSize);
  line(sixthSize, 0, -halfSize, sixthSize, 0, halfSize);
  popMatrix();
  
  pushMatrix();
  translate(0, halfSize, 0);
  fill(BLUE);
  box(boxSize, 1, boxSize); 
  translate(0, 1, 0);
  fill(BLACK);
  line(-halfSize, 0, -sixthSize, halfSize, 0, -sixthSize);
  line(-halfSize, 0, sixthSize, halfSize, 0, sixthSize);
  line(-sixthSize, 0, -halfSize, -sixthSize, 0, halfSize);
  line(sixthSize, 0, -halfSize, sixthSize, 0, halfSize);
  popMatrix();
  
  pushMatrix();
  translate(0, 0, -halfSize);
  fill(YELLOW);
  box(boxSize, boxSize, 1);
  translate(0, 0, -1);
  fill(BLACK);
  line(-halfSize, -sixthSize, 0, halfSize, -sixthSize, 0);
  line(-halfSize, sixthSize, 0, halfSize, sixthSize, 0);
  line(-sixthSize, -halfSize, 0, -sixthSize, halfSize, 0);
  line(sixthSize, -halfSize, 0, sixthSize, halfSize, 0);
  popMatrix();
  
  pushMatrix();
  translate(0, 0, halfSize);
  fill(WHITE);
  box(boxSize, boxSize, 1);
  translate(0, 0, 1);
  fill(BLACK);
  line(-halfSize, -sixthSize, 0, halfSize, -sixthSize, 0);
  line(-halfSize, sixthSize, 0, halfSize, sixthSize, 0);
  line(-sixthSize, -halfSize, 0, -sixthSize, halfSize, 0);
  line(sixthSize, -halfSize, 0, sixthSize, halfSize, 0);
  popMatrix();
}