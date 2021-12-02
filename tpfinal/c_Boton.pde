class Boton {

  float x, y, ancho, alto, op, c;
  int rr;
  String t;

  Boton() {

    rr = 30;
    
    op = 230;

    c = 0;
  }

  void dibujaBoton(String t_, float x_, float y_, float ancho_, float alto_) {

    x = x_;
    y = y_;

    ancho = ancho_;
    alto = alto_;

    t = t_;

    pushStyle();
    pushMatrix();

    translate(x, y); 

    rectMode(CENTER);
    stroke(255, 50);
    strokeWeight(5);
    fill(c, op);
    rect(0, 0, ancho_, alto_, rr);

    fill(255);

    textAlign(CENTER, CENTER);
    textSize(20);
    text(t, 0, 0);

    popMatrix();
    popStyle();
  }

  //detectar colision del mouse con una superficie cuadrada
  boolean colisionMouse() {

    if (
      x - ancho/2 < mouseX
      && x + ancho/2 > mouseX
      && y - alto/2 < mouseY
      && y + alto/2 > mouseY
      ) {
      return true;
    } else {
      return false;
    }
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
