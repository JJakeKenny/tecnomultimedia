class Texto {

  float x, y, s;

  int c, rc, tc;

  String t, ct;

  Texto() {
  }

  void dibujaTexto(String t_, float x_, float y_, float s_, int c_) {

    x = x_;

    y = y_;

    s = s_;

    c = c_;

    t = t_;

    pushMatrix();
    pushStyle();

    translate(x, y);

    fill(c);
    textAlign(CENTER, CENTER);
    textSize(s);
    text(t, 0, 0, 560, 150);

    popStyle();
    popMatrix();
  }

  void dibujaCuadrotexto(String ct_, int rc_, int tc_) {

    ct = ct_;

    rc = rc_;

    tc = tc_;

    pushMatrix();
    pushStyle();

    translate(300, 500);

    rectMode(CENTER);
    fill(rc, 200);
    rect(0, 0, 550, 150, 30);

    fill(tc);
    textSize(18);
    text(ct, 0, 0, 530, 140);

    popStyle();
    popMatrix();
  }
}
