class Camion {

  PImage camion;

  float x, y, v, x1, y1, v1;

  Camion() {

    camion = loadImage("camion_00.png");

    x = 240;

    y = -200;

    v = random(2, 6);

    x1 = 360;

    y1 = 600;

    v1 = random(3, 7);
  }

  void dibujaCamionA() {

    pushMatrix();
    pushStyle();

    translate(x, y);

    image(camion, 0, 0);

    popStyle();
    popMatrix();
  }

  void mueveCamionA() {

    y += v;

    if (y > 800) {

      y = random(-150, -400);

      v = random(2, 6);
    }
  }

  void dibujaCamionB() {

    pushMatrix();
    pushStyle();

    translate(x1, y1);

    rotate(PI);

    image(camion, 0, 0);

    popStyle();
    popMatrix();
  }

  void mueveCamionB() {

    y1 -= v1;

    if (y1 < -200) {

      y1 = random(750, 1000);

      v1 = random(3, 7);
    }
  }

  boolean colisionCamionA(float x_, float y_) {

    if (
      x - 55 < x_+20
      && x + 55 > x_-20
      && y - 110 < y_+27
      && y + 110 > y_-27
      ) {
      return true;
    } else {
      return false;
    }
  }

  boolean colisionCamionB(float x_, float y_) {

    if (
      x1 - 60 < x_+20
      && x1 + 60 > x_-20
      && y1 - 115 < y_+27
      && y1 + 115 > y_-27
      ) {
      return true;
    } else {
      return false;
    }
  }
}
