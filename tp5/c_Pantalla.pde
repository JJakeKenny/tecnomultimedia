class Pantalla {

  PImage nivel1, nivel2, nivel3, nivel4, nivel5, nivel6, nivel7, arma;

  int p, contP, op;

  Pantalla() {

    p = 0;

    op = 255;

    contP = 0;

    nivel1 = loadImage("nivel_00.png");

    nivel2 = loadImage("nivel_01.png");

    nivel3 = loadImage("nivel_02.png");

    nivel4 = loadImage("nivel_03.png");

    nivel5 = loadImage("nivel_04.png");

    nivel6 = loadImage("nivel_05.png");

    nivel7 = loadImage("nivel_06.png");

    arma = loadImage("arma.png");
  }


  void cambiaPantalla() {

    pushStyle();

    rectMode(CENTER);

    imageMode(CENTER);

    if (p == 0) {

      background(200, 50, 100);

      juego.texto2.dibujaTexto();

      juego.texto3.dibujaTexto();

      juego.boton0.dibujaBoton();

      if (juego.boton0.colisionBoton(juego.yo.px, juego.yo.py)) {

        p = 1; 

        juego.yo.px = 20;

        juego.yo.py = 300;
      }
    } else if (p == 1) {

      if (juego.arma) {
        image(nivel4, 300, 300);
      } else {
        image(nivel1, 300, 300);
      }

      juego.camionA.dibujaCamionA();
      juego.camionA.mueveCamionA();

      juego.camionB.dibujaCamionB();
      juego.camionB.mueveCamionB();

      if (
        juego.camionA.colisionCamionA(juego.yo.px, juego.yo.py) 
        ||
        juego.camionB.colisionCamionB(juego.yo.px, juego.yo.py)
        ) {

        p = 4;

        juego.yo.px = 300;

        juego.yo.py = 500;
      }
    } else if ( p == 2) {

      image(nivel2, 300, 300);
    } else if ( p == 3) {

      background(0);

      pushStyle();
      tint(255, 150);
      image(nivel2, 300, 300);
      popStyle();

      juego.texto4.dibujaTexto();
      juego.texto5.dibujaTexto();

      image(arma, 300, 150);

      juego.arma = true;

      if (mousePressed) {
        p = 5;
      }
    } else if ( p == 4) {

      background(0);

      juego.texto0.dibujaTexto();
      juego.texto1.dibujaTexto();

      juego.boton1.dibujaBoton();

      if (juego.boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        setup();
      }
    } else if ( p == 5) {

      image(nivel3, 300, 300);
    } else if ( p == 6) {

      image(nivel5, 300, 300);
    } else if ( p == 7) {

      image(nivel6, 300, 300);

      for ( int i=0; i<juego.papel.length; i++) {
        juego.papel[i].dibujaPapel();

        if (juego.papel[i].colisionPapel(juego.yo.px, juego.yo.py) || juego.disparo.seDisparo) {

          p = 8;

          juego.yo.px = 300;

          juego.yo.py = 500;
        }
      }
    } else if ( p == 8) {

      background(0);

      juego.texto0.dibujaTexto();
      juego.texto6.dibujaTexto();

      juego.boton1.dibujaBoton();

      if (juego.boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        setup();
      }
    } else if ( p == 9) {

      pushStyle();
      tint(255, op);
      image(nivel7, 300, 300);
      popStyle();

      if (juego.en.vidas > 0) {
        juego.en.dibujar();
        juego.en.dibujaDisparo();
        juego.en.mover();
      }

      if (juego.disparo.colisionBala(juego.en.x, juego.en.y) ) {

        juego.en.vidas -= 1;
      }

      if (juego.disparoEn.colisionBala(juego.yo.px, juego.yo.py) ) {

        juego.yo.vidas -= 1;
      }

      if (juego.en.vidas <= 0) {

        contP ++;

        juego.en.dibujar();

        if (contP >= 100) {

          op --;
        } 
        if (contP >= 350) {

          juego.texto7.dibujaTexto();

          juego.muerto = true;
        } 
        if (contP >= 850) {

          juego.texto3.dibujaTexto();
        } 
        if (contP >= 1100) {

          juego.muerto = false;

          setup();
        }
      } else if (juego.yo.vidas <= 0) {

        p = 10;

        juego.yo.px = 300;

        juego.yo.py = 500;
      }
    } else if ( p == 10) {

      background(0);

      juego.texto0.dibujaTexto();

      juego.texto8.dibujaTexto();

      juego.boton1.dibujaBoton();

      if (juego.boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        setup();
      }
    }

    popStyle();
  }
}
