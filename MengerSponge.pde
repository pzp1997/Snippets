int depth;
float a;

float SIZE;
float HALF_WID_HGT;

void setup() {
  
  size(500, 500, P3D);
  
  SIZE = 100;
  
  HALF_WID_HGT = min(width, height) / 2;
  
}

void draw() {
  background(127);
  
  translate(HALF_WID_HGT, HALF_WID_HGT, HALF_WID_HGT);
  rotateX(a += 0.002);
  rotateY(a += 0.002);
  rotateZ(a += 0.002);
  mengerSponge(0, 0, 0, SIZE, depth);
}

void mousePressed() {
  depth++;
}

void mengerSponge(float x, float y, float z, float sz, int depth) {
  
  if (depth < 1) {
    pushMatrix();
    translate(x, y, z);
    box(sz);
    popMatrix();
    return;
  }
  
  float thirdSize = sz / 3;
  
  for (int i = -1; i <= 1; i++) {
    for (int j = -1; j <= 1; j++) {
      for (int k = -1; k <= 1; k++) {
        if (i != 0 && (j != 0 || k != 0) || j != 0 && k != 0) {
          float newX = x + i * thirdSize;
          float newY = y + j * thirdSize;
          float newZ = z + k * thirdSize;
          mengerSponge(newX, newY, newZ, thirdSize, depth - 1);
        }
      }
    }
  }
  
}