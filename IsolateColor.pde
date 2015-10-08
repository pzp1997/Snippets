import processing.video.*;

Capture cam;
PImage filteredImg;
color selectedColor;
int threshold;
boolean showFiltered, blackAndWhite;

void setup() {
  size(400, 400);

  if (Capture.list().length == 0) {
    println("No cameras detected.");
    exit();
  }
  cam = new Capture(this, width, height);
  cam.start();

  filteredImg = createImage(width, height, RGB);

  threshold = 10;
  
  blackAndWhite = true;
}

void draw() {
  if (cam.available()) {
    cam.read();
  }

  isolateColor(cam, filteredImg, selectedColor, threshold);

  if (showFiltered) {
    set(0, 0, filteredImg);
  } else {
    set(0, 0, cam);
  }
}

void mousePressed() {
  selectedColor = cam.get(mouseX, mouseY);
  println("selectedColor: " + colorToString(selectedColor));
}

void keyPressed() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        threshold++;
        println("Threshold: " + threshold);
        break;
      case DOWN:
        threshold--;
        println("Threshold: " + threshold);
        break;
      case SHIFT:
        blackAndWhite = false;
        break;
    }
  } else if (key == ' ') {
    showFiltered = !showFiltered;
  }
}

void keyReleased() {
  if (key == CODED && keyCode == SHIFT) {
    blackAndWhite = true;
  }
}

void isolateColor(PImage inImg, PImage outImg, color inClr, int thresh) {
  color clr;

  inImg.loadPixels();

  for (int i = 0; i < inImg.pixels.length; i++) {
    clr = inImg.pixels[i];

    if (abs(red(clr) - red(inClr)) > thresh ||
      abs(green(clr) - green(inClr)) > thresh ||
      abs(blue(clr) - blue(inClr)) > thresh) {
      outImg.pixels[i] = color(0);
    } else if (blackAndWhite) {
      outImg.pixels[i] = color(255);
    } else {
      outImg.pixels[i] = clr;
    }
  }

  outImg.updatePixels();
}

String colorToString(color clr) {
  return "(" + red(clr) + ", " + green(clr) + ", " + blue(clr) + ")";
}
