class Obstaculo {

  PImage papel;

  float x, y, r;

  Obstaculo(float x_, float y_) {

    papel = loadImage("papel.png");

    x = x_;

    y = y_;

    r = random(0, 2);
  }

  void dibujaPapel() {

    pushMatrix();
    pushStyle();

    translate(x, y);

    image(papel, 0, 0);

    popStyle();
    popMatrix();
  }

  boolean colisionPapel(float x_, float y_) {

    if (
      x - 22 < x_+16
      && x + 22 > x_-16
      && y - 17 < y_+22
      && y + 17 > y_-22
      ) {
      return true;
    } else {
      return false;
    }
  }
}
