class Pantalla {

  PImage nivel1, nivel2, nivel3, nivel4, nivel5, nivel6, nivel7, arma;

  int cantTextos, p, contP, op;

  Enemigo en;

  Camion camionA;

  Camion camionB;

  Boton boton0, boton1;

  Obstaculo [] papel;

  Texto[] texto;

  String[] textos;

  PFont miFuente;

  Pantalla() {

    en = new Enemigo();

    camionA = new Camion();

    camionB = new Camion();

    papel = new Obstaculo[4];

    boton0 = new Boton();

    boton1 = new Boton();

    for ( int i=0; i<papel.length; i++) {
      papel[i] = new Obstaculo(random(200, 400), i*350/papel.length + 150);
    }

    cantTextos = 9;

    //carga de archivo de texto.txt para el array de textos
    textos = loadStrings("data/textosJuego.txt");

    texto = new Texto[cantTextos];

    //carga de la fuente personalizada
    miFuente = createFont("tipografia.TTF", 20);

    for ( int i=0; i<cantTextos; i++) {
      texto[i] = new Texto();
    }

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

    textFont(miFuente);

    rectMode(CENTER);

    imageMode(CENTER);

    if (p == 0) {

      background(200, 50, 100);

      texto[2].dibujaTexto(textos[2], 300, 420, 15, 30);

      texto[3].dibujaTexto(textos[3], 300, 100, 70, 255);

      boton0.dibujaBoton("Comenzar", 300, 270, 300, 100);

      if (boton0.colisionBoton(juego.yo.px, juego.yo.py)) {

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

      camionA.dibujaCamionA();
      camionA.mueveCamionA();

      camionB.dibujaCamionB();
      camionB.mueveCamionB();

      if (
        camionA.colisionCamionA(juego.yo.px, juego.yo.py) 
        ||
        camionB.colisionCamionB(juego.yo.px, juego.yo.py)
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

      texto[4].dibujaTexto(textos[4], 300, 350, 30, 255);
      texto[5].dibujaTexto(textos[5], 300, 420, 20, 230);

      image(arma, 300, 150);

      juego.arma = true;

      if (mousePressed) {
        p = 5;
      }
    } else if ( p == 4) {

      background(0);

      texto[0].dibujaTexto(textos[0], 300, 100, 60, 255);
      texto[1].dibujaTexto(textos[1], 300, 200, 20, 255);

      boton1.dibujaBoton("Reiniciar", 300, 350, 300, 100);

      if (boton1.colisionBoton(juego.yo.px, juego.yo.py)) {
        juego.reiniciaJuego();
      }
    } else if ( p == 5) {

      image(nivel3, 300, 300);
    } else if ( p == 6) {

      image(nivel5, 300, 300);
    } else if ( p == 7) {

      image(nivel6, 300, 300);

      for ( int i=0; i<papel.length; i++) {
        papel[i].dibujaPapel();

        if (papel[i].colisionPapel(juego.yo.px, juego.yo.py) || juego.disparo.seDisparo) {

          p = 8;

          juego.yo.px = 300;

          juego.yo.py = 500;
        }
      }
    } else if ( p == 8) {

      background(0);

      texto[0].dibujaTexto(textos[0], 300, 100, 60, 255);
      texto[6].dibujaTexto(textos[6], 300, 200, 20, 255);

      boton1.dibujaBoton("Reiniciar", 300, 350, 300, 100);

      if (boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        juego.reiniciaJuego();
      }
    } else if ( p == 9) {

      background(200, 50, 100);

      pushStyle();
      tint(255, op);
      image(nivel7, 300, 300);
      popStyle();

      if (en.vidas > 0) {
        en.dibujar();
        en.dibujaDisparo();
        en.mover();
      }

      if (juego.disparo.colisionBala(en.x, en.y) ) {

        en.vidas -= 1;
      }

      if (juego.disparoEn.colisionBala(juego.yo.px, juego.yo.py) ) {

        juego.yo.vidas -= 1;
      }

      if (en.vidas <= 0) {

        contP ++;

        en.dibujar();

        if (contP >= 100) {

          op --;
        } 
        if (contP >= 350) {

          texto[7].dibujaTexto(textos[7], 300, 430, 15, 255);

          juego.muerto = true;
        } 
        if (contP >= 850) {

          texto[3].dibujaTexto(textos[3], 300, 100, 70, 255);
        } 
        if (contP >= 1100) {

          juego.muerto = false;

          juego.ganaste = true;

          aventura.reiniciaAventura();
        }
      } else if (juego.yo.vidas <= 0) {

        p = 10;

        juego.yo.px = 300;

        juego.yo.py = 500;
      }
    } else if ( p == 10) {

      background(0);

      texto[0].dibujaTexto(textos[0], 300, 100, 60, 255);

      texto[8].dibujaTexto(textos[8], 300, 200, 20, 255);

      boton1.dibujaBoton("Reiniciar", 300, 350, 300, 100);

      if (boton1.colisionBoton(juego.yo.px, juego.yo.py)) {

        juego.reiniciaJuego();

        //hacer una función tipo boolean dentro de la clase que devuelva "gano" o "perdio" para que dentro de la aventura
        //grafica poder preguntar si gano, y en ese caso salir del juego y seguir a la pantalla que sigue en la aventura

        //Al hacer "return" en el boolean se puede devolver un valor, por ejemplo "return (puntos >= 50);"
      }
    }

    popStyle();
  }
}
