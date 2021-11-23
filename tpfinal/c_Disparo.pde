class Bala {

  float x, y, v, maxV, angle;

  boolean seDisparo;

  Bala() {

    x = 0;
    y = 0;

    v = 3;

    maxV = 20;

    seDisparo = false;
  }

  void posicionInicial(float inicioX_, float inicioY_, float inicioR_) {

    if (seDisparo == false) {
      x = inicioX_;
      y = inicioY_;

      angle = inicioR_;

      seDisparo = true;
    }
  }

  void dibujaDisparo() {

    if (juego.arma == true) {
      if (seDisparo) {

        pushMatrix();
        pushStyle();

        translate(x, y);

        rotate(angle);

        fill(255, 255, 0);

        rectMode(CENTER);

        rect(0+20, 0+25, 20, 5);

        popStyle();
        popMatrix();
      }
    }
  }
  void viajeDisparo() {

    if (seDisparo) {

      if (v < maxV) {
        v+=2;
      }

      x += cos(angle) * v;
      y += sin(angle) * v;

      if (x > width || x < 0 || y > height || y < 0) {

        v= 3;

        seDisparo = false;
      }
    }
  }

  boolean colisionBala(float x_, float y_) {

    if (
      x - 10 < x_+30
      && x + 10 > x_-30
      && y - 3 < y_+30
      && y + 3 > y_-30
      ) {
      seDisparo = false;
      x = 0;
      y = 0;
      return true;
    } else {
      return false;
    }
  }
}
