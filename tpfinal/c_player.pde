class Player {

  float px, py, mx, my, pAngle;

  PImage steve, steveArma, steveMuerto;

  int vidas;

  int numFrames = 12;

  int currentFrame = 0;

  PImage[] sprites = new PImage[numFrames];

  Player() {

    for (int i = 0; i <numFrames; i++) {

      sprites[i] = loadImage("sprite_" + nf(i, 2) + ".png");
    }

    px = 300;
    py = 500;

    mx = 2.3;
    my = 2.3;

    vidas = 5;
  }

  void dibujar() {

    pushMatrix();
    pushStyle();

    translate(px, py);

    steve = loadImage("steve_00.png");

    pAngle = atan2(mouseY-py, mouseX-px);

    rotate(pAngle);

    imageMode(CENTER);

    image (steve, 0, 0); 

    popStyle();
    popMatrix();
  }

  //modifica el sprite al llegar al final
  void muerto() {

    pushMatrix();
    pushStyle();

    translate(350, 250);

    steveMuerto = loadImage("sprite_12.png");

    imageMode(CENTER);

    image (steveMuerto, 0, 0); 

    popStyle();
    popMatrix();
  }

  //cambia el sprite por defaul al recoger el arma
  void conArma() {

    pushMatrix();
    pushStyle();

    translate(px, py);

    steveArma = loadImage("sprite_00.png");

    pAngle = atan2(mouseY-py, mouseX-px);

    rotate(pAngle);

    imageMode(CENTER);

    image (steveArma, 0, 0); 

    popStyle();
    popMatrix();
  }

  //reproduce la animación de disparo al hacer click
  void disparo() {

    pushMatrix();
    pushStyle();

    translate(px, py);

    rotate(pAngle);

    imageMode(CENTER);

    if (juego.disparando) {
      if (currentFrame >= 11) {
        currentFrame = 0; 
        juego.disparando = false;
      } else { 
        currentFrame = (currentFrame+1) % numFrames;
      }
    }
    for (int i=0; i<1; i++) {
      image(sprites[(currentFrame)], 0, 0);
    }

    popStyle();
    popMatrix();
  }

  //modificación del eje X e Y a través de las teclas
  void mover() {

    if (juego.keys['a']) { 
      px-=mx;
    }
    if (juego.keys['d']) { 
      px+=mx;
    }
    if (juego.keys['w']) { 
      py-=my;
    }
    if (juego.keys['s']) { 
      py+=my;
    }
  }

  //no permite al jugador salirse de la pantalla
  void colisionPared() {

    px = constrain(px, 23, width-23);

    py = constrain(py, 30, height-30);

    if (juego.cPantalla.p == 7) {

      px = constrain(px, 180, 420);

      py = constrain(py, 30, height-30);
    }
  }

  //comprueba la posición del jugador para modificar la pantalla en la que se encuentra
  void pasarN () {

    if (juego.cPantalla.p == 1) {

      if (juego.arma) {

        if (px < 50) {

          juego.cPantalla. p = 6;

          px = 560;

          py = 300;
        }
      } else if (px > 540) {

        juego.cPantalla.p =2;

        px = 50;
      }
    } else if (juego.cPantalla.p == 2) {

      if (px > 400 && px < 500 && py > 450) {

        juego.cPantalla.p = 3;
      }
    } else if (juego.cPantalla.p == 5) {

      if (px < 70) {

        juego.cPantalla.p = 1; 

        px = 530;

        py = 300;
      }
    } else if (juego.cPantalla.p == 6) {

      if (py < 70) {

        juego.cPantalla.p = 7; 

        px = 300;

        py = 560;
      }
    } else if (juego.cPantalla.p == 7) {

      if (py < 70) {

        juego.cPantalla.p = 9; 

        px = 300;

        py = 560;
      }
    }
  }
}
