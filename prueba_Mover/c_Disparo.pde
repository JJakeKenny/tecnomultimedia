class Bala {

  float x, y, vx, vy, angle;
  

  Bala() {

    x = 300;
    y = 300;
    
    angle = atan2(mouseY-y, mouseX-x);

    vx = 3;
    vy = 3;
  }

  void dibujaDisparo() {
    
    if(bala){

    pushMatrix();

    translate(x, y);
    
    rotate(angle);
    
    rectMode(CORNER);

    rect(0, 0, 5, 20);

    popMatrix();
    
    }
  }


  void viajeDisparo() {

    if (bala) {

      if (x > mX) {

        x -= vx;
      } else if (x < mX) {

        x += vx;
      }

      if (y > mY) {

        y -= vy;
      } else if (y < mY) {

        y += vy;
      }
    }
  }
}
