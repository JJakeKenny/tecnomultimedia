class Enemigo {

  float x, y, vx, vy, eAngle;

  int cont, vidas;

  PImage vivo, muerto;

  int numFrames = 12;

  int currentFrame = 0;

  PImage[] spritesEn = new PImage[numFrames];

  boolean eDisparo;

  Enemigo() {

    for (int i = 0; i <numFrames; i++) {

      spritesEn[i] = loadImage("en_" + nf(i, 2) + ".png");
    }

    x = 200;
    y = 150;

    vx = 0;
    vy = 0;

    cont = 0;

    vidas = 15;

    eDisparo = false;
  }

  void dibujar() {

    if (vidas > 0) {

      pushMatrix();
      pushStyle();

      translate(x, y);

      eAngle = atan2(juego.yo.py-y, juego.yo.px-x);

      rotate(eAngle);

      vivo = loadImage("en_00.png");

      imageMode(CENTER);

      image (vivo, 0, 0);

      popStyle();
      popMatrix();
    } else { 

      pushMatrix();
      pushStyle();

      translate(x, y);

      vivo = loadImage("en_00.png");

      muerto = loadImage("en_12.png");

      imageMode(CENTER);

      image (muerto, 0, 0);

      popStyle();
      popMatrix();
    }
  }

  void dibujaDisparo() {

    pushMatrix();
    pushStyle();

    translate(x, y);

    rotate(eAngle);

    imageMode(CENTER);

    if (eDisparo) {
      if (currentFrame >= 11) {
        currentFrame = 0; 
        eDisparo = false;
      } else { 
        currentFrame = (currentFrame+1) % numFrames;
      }
    }

    for (int i=0; i<1; i++) {
      image(spritesEn[(currentFrame)], 0, 0);
    }

    popStyle();
    popMatrix();
  }

  void mover() {

    x = constrain(x, 50, width-50);

    y = constrain(y, 40, height-50);

    cont ++;

    x += vx;

    y += vy;

    if (cont == 100) {

      vx = random(-3, 3);
      vy = random(-3, 3);

      eDisparo = true;

      juego.disparoEn.posicionInicial(x, y, eAngle);
    } else if (cont == 150) {
      eDisparo = true;

      juego.disparoEn.posicionInicial(x, y, eAngle);
    } else if (cont >= 180) {

      eDisparo = false;

      cont = 0;

      vx = 0;

      vy = 0;
    }
  }
}
