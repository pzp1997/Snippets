final int MAX_DEPTH = 6;
final color BG_COLOR = color(128, 0, 128);  // purple
final color FG_COLOR = color(255);  // white

int depth = 0;
int incr = 1;

void setup() {
  size(500, 500);
  rectMode(CENTER);
  
  noStroke();
  fill(FG_COLOR);
}

void draw() {
  background(BG_COLOR);
  sierpinskiCarpet(width/2, height/2, min(width, height), depth);
}

void mousePressed() { 
  depth += incr;
  if (depth < 1 || depth > MAX_DEPTH)
    incr *= - 1;
}

void sierpinskiCarpet(float x, float y, float sz, int depth) {
  if (depth <= 0)
    return;
    
  float thirdSize = sz / 3;
  depth--;
  
  rect(x, y, thirdSize, thirdSize);
  
  sierpinskiCarpet(x - thirdSize, y, thirdSize, depth);
  sierpinskiCarpet(x + thirdSize, y, thirdSize, depth);
  sierpinskiCarpet(x, y - thirdSize, thirdSize, depth);
  sierpinskiCarpet(x, y + thirdSize, thirdSize, depth);

  sierpinskiCarpet(x - thirdSize, y - thirdSize, thirdSize, depth);
  sierpinskiCarpet(x + thirdSize, y - thirdSize, thirdSize, depth);
  sierpinskiCarpet(x + thirdSize, y + thirdSize, thirdSize, depth);
  sierpinskiCarpet(x - thirdSize, y + thirdSize, thirdSize, depth);
}