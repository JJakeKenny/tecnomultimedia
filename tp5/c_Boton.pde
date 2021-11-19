class Boton {

  float x, y, ancho, alto, op, c;
  String texto;

  Boton(String texto_, float x_, float y_, float ancho_, float alto_) {

    x = x_;
    y = y_;

    ancho = ancho_;
    alto = alto_;

    op = 220;

    c = 0;

    texto = texto_;
  }

  void dibujaBoton() {

    pushStyle();
    pushMatrix();

    translate(x, y); 

    rectMode(CENTER);
    stroke(255, 50);
    strokeWeight(5);
    fill(c, op);
    rect(0, 0, ancho, alto, 20);

    fill(255);

    textAlign(CENTER, CENTER);
    textSize(20);
    text(texto, 0, 0);

    popMatrix();
    popStyle();
  }

  boolean colisionBoton(float x_, float y_) {

    if (
      x - ancho/2 < x_+23
      && x + ancho/2 > x_-23
      && y - alto/2 < y_+30
      && y + alto/2 > y_-30
      ) {
      op -=2;
      c = 255;
    }
    if (op <= 0) {
      return true;
    } else {
      return false;
    }
  }
}
