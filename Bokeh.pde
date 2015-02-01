import java.util.*;

Random gen = new Random();
float r;

void setup() {
  size(400, 400);
  background(0);
  noStroke();
}

void draw() {
  fill(random(255), random(255), random(255), 50);
  r = normDist(60, 15);
  ellipse(normDist(mouseX, width/10), normDist(mouseY, height/10), r, r);
}

float normDist(float mean, float sd) {
  float num = (float) gen.nextGaussian();
  return mean + num*sd;
}
