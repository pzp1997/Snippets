void setup() {
  size(300, 300);
  background(255);
  fill(random(255), random(255), random(255));
  noStroke();
  rectMode(CENTER);
}

void draw() {
  rect(mouseX, mouseY, width/5, width/5);
  if (covered(get(0,0))) {
    background(255);
    fill(random(255), random(255), random(255));
  }
}

boolean covered(color c) {
  // Checks if screen is covered with color c
  loadPixels();
  for (int i = 0; i < width*height; i++) {
    if (pixels[i] != c) {
      return false;
    }
  }
  return true;
}

