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

      juego.texto[2].dibujaTexto(juego.textos[2], 300, 420, 15, 30);

      juego.texto[3].dibujaTexto(juego.textos[3], 300, 100, 70, 255);

      juego.boton0.dibujaBoton("Comenzar", 300, 270, 300, 100);

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

      juego.texto[4].dibujaTexto(juego.textos[4], 300, 350, 30, 255);
      juego.texto[5].dibujaTexto(juego.textos[5], 300, 420, 20, 230);

      image(arma, 300, 150);

      juego.arma = true;

      if (mousePressed) {
        p = 5;
      }
    } else if ( p == 4) {

      background(0);

      juego.texto[0].dibujaTexto(juego.textos[0], 300, 100, 60, 255);
      juego.texto[1].dibujaTexto(juego.textos[1], 300, 200, 20, 255);

      juego.boton1.dibujaBoton("Reiniciar", 300, 350, 300, 100);

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

      juego.texto[0].dibujaTexto(juego.textos[0], 300, 100, 60, 255);
      juego.texto[6].dibujaTexto(juego.textos[6], 300, 200, 20, 255);

      juego.boton1.dibujaBoton("Reiniciar", 300, 350, 300, 100);

      if (juego.boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        setup();
      }
    } else if ( p == 9) {
      
      background(200, 50, 100);

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

          juego.texto[7].dibujaTexto(juego.textos[7], 300, 430, 15, 0);

          juego.muerto = true;
        } 
        if (contP >= 850) {

          juego.texto[3].dibujaTexto(juego.textos[3], 300, 100, 70, 255);
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

      juego.texto[0].dibujaTexto(juego.textos[0], 300, 100, 60, 255);

      juego.texto[8].dibujaTexto(juego.textos[8], 300, 200, 20, 255);

      juego.boton1.dibujaBoton("Reiniciar", 300, 350, 300, 100);

      if (juego.boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        setup();
      }
    }

    popStyle();
  }
}
