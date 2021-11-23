class Aventura {

  int pantalla;

  int eDif;

  int cantTextos, cantBotones;

  boolean DEBUG = false;

  //creación del array que guarde las lineas de texto 

  String[] textos;

  //creación del array que guarde las imágenes

  PImage[] fondo = new PImage [12]; 

  Texto[] texto;

  Boton[] boton;

  Aventura() {

    //asignacion de valores a las variables, construcción de objetos

    cantTextos = 23;

    cantBotones = 20;

    texto = new Texto[cantTextos];

    boton = new Boton[cantBotones];

    for ( int i=0; i<cantTextos; i++) {
      texto[i] = new Texto();
    }

    for ( int i=0; i<cantBotones; i++) {
      boton[i] = new Boton();
    }

    pantalla = 0;

    eDif = 0;

    //carga del archivo de texto mediante estructura for
    textos = loadStrings("data/Textos.txt");

    for ( int i=0; i<12; i++) {

      fondo[i]  = loadImage ("img_" + nf(i, 2) + ".png");
    }
  }

  void actualizaAventura() {


    println("loop0:" + loop0 + "-" + "loop1:" + loop1 + "-" + "contador" + eDif);
    println(textos.length);

    //pantallas y su lógica de estados para la representación de las imágenes y dibujos
    if (pantalla == 0) {

      image (fondo[0], 0, 0, width, height);

      if (loop0 || loop1) {
        boton[0].dibujaBoton("Continuar...", 300, 250, 275, 125);
      } else {
        boton[1].dibujaBoton("Empezar", 300, 250, 250, 100);
      }
      boton[2].rr = 80;
      boton[2].dibujaBoton("Créditos", 300, 450, 150, 100);
    } else if ( pantalla == 1 ) {

      playlist[0].play();

      image (fondo[1], 0, 0, width, height);

      if (loop0) {
        texto[9].dibujaCuadrotexto(textos[9], 0, 255);
      } else if (loop1) {
        texto[22].dibujaCuadrotexto(textos[22], 0, 255);
      } else {
        texto[0].dibujaCuadrotexto(textos[0], 0, 255);
      }
    } else if ( pantalla == 2 ) {

      image (fondo[1], 0, 0, width, height);

      if (loop0) {
        texto[10].dibujaCuadrotexto(textos[10], 0, 255);
      } else {
        texto[1].dibujaCuadrotexto(textos[1], 0, 255);
      }
    } else if ( pantalla == 3 ) {

      image (fondo[1], 0, 0, width, height);

      if (loop0) {
        texto[11].dibujaCuadrotexto(textos[11], 0, 255);
      } else {
        texto[2].dibujaCuadrotexto(textos[2], 0, 255);
      }
    } else if ( pantalla == 4 ) {

      image (fondo[2], 0, 0, width, height);

      if (loop0) {
        texto[12].dibujaCuadrotexto(textos[12], 0, 255);
      } else {
        texto[3].dibujaCuadrotexto(textos[3], 0, 255);
      }
    } else if ( pantalla == 5 ) {

      image (fondo[3], 0, 0, width, height);

      if (loop0) {
        texto[13].dibujaCuadrotexto(textos[13], 0, 255);
      } else {
        texto[4].dibujaCuadrotexto(textos[4], 0, 255);
      }
    } else if ( pantalla == 6 ) {

      playlist[1].play();

      image (fondo[3], 0, 0, width, height);

      if (loop0 && playlist[1].position() == playlist[1].length()) {
        texto[14].dibujaCuadrotexto(textos[14], 0, 255);
      } else if (playlist[1].position() == playlist[1].length()) {
        texto[5].dibujaCuadrotexto(textos[5], 0, 255);
      }
    } else if ( pantalla == 7 ) {

      image (fondo[3], 0, 0, width, height);

      boton[3].dibujaBoton("Abrir la puerta", 300, 200, 200, 70);
      boton[4].dibujaBoton("Mirar por la mirilla", 300, 300, 250, 70);
      boton[5].dibujaBoton("Ignorarlo y seguir durmiendo", 300, 400, 340, 70);
    } else if ( pantalla == 8 ) {

      image (fondo[3], 0, 0, width, height);

      eDif +=4; 

      pushStyle();
      fill(0, eDif); 
      rect(0, 0, 600, 600);
      popStyle();

      playlist[2].play();

      if (eDif >= 280) {
        playlist[3].play(); 
        texto[6].dibujaCuadrotexto(textos[6], 255, 0);
      }
    } else if ( pantalla == 9 ) {

      image (fondo[4], 0, 0, width, height);
    } else if ( pantalla == 10 ) {

      image (fondo[5], 0, 0, width, height);

      playlist[4].play();

      eDif +=4; 

      pushStyle();
      fill(0, eDif); 
      rect(0, 0, 600, 600);
      popStyle();

      if (eDif >255) { 
        playlist[3].play();
        texto[7].dibujaCuadrotexto(textos[7], 255, 0);
      }
    } else if ( pantalla == 11 ) {

      image (fondo[5], 0, 0, width, height);

      boton[6].dibujaBoton("Abrir", 300, 200, 200, 70);
      boton[7].dibujaBoton("Llamar a la policía", 300, 300, 250, 70);
      boton[8].dibujaBoton("Esperar que se valla", 300, 400, 340, 70);
    } else if ( pantalla == 12 ) {

      image (fondo[5], 0, 0, width, height);

      playlist[4].play();

      eDif +=4; 

      pushStyle();
      fill(0, eDif); 
      rect(0, 0, 600, 600);
      popStyle();

      if (eDif >255) { 
        playlist[3].play();
        texto[8].dibujaCuadrotexto(textos[8], 255, 0);
      }
    } else if ( pantalla == 13 ) {

      image (fondo[5], 0, 0, width, height);

      boton[9].dibujaBoton("Esconderte", 300, 200, 200, 70);
      boton[10].dibujaBoton("Enfrentarlo", 300, 300, 250, 70);
      boton[11].dibujaBoton("Escapar", 300, 400, 340, 70);
    } else if ( pantalla == 14 ) {

      image (fondo[6], 0, 0, width, height);

      texto[15].dibujaCuadrotexto(textos[15], 255, 0);
    } else if ( pantalla == 15 ) {

      image (fondo[5], 0, 0, width, height);

      boton[12].dibujaBoton("Razonar con él", 300, 200, 200, 70);
      boton[13].dibujaBoton("Buscar un arma", 300, 300, 250, 70);
    } else if ( pantalla == 16 ) {

      image (fondo[5], 0, 0, width, height);

      //falta pantalla
    } else if ( pantalla == 17 ) {

      image (fondo[7], 0, 0, width, height);

      playlist[4].play();

      if (eDif >= 50) {

        boton[14].dibujaBoton("Mantenerse escondido", 300, 200, 250, 70);
        boton[15].dibujaBoton("Atacarlo distraído", 300, 300, 250, 70);
      } else {
        eDif ++;
      }
    } else if ( pantalla == 18 ) {

      if (eDif <=255) {
        eDif +=2;
      } else {

        playlist[3].play();

        pushStyle();
        fill(0, eDif); 
        rect(0, 0, 600, 600);
        popStyle();
      }
      pushStyle();
      tint(eDif);
      image (fondo[8], 0, 0, width, height);
      popStyle();
    } else if ( pantalla == 19 ) {

      image (fondo[9], 0, 0, width, height);

      texto[16].dibujaCuadrotexto(textos[16], 255, 0);
    } else if ( pantalla == 20 ) {

      image (fondo[9], 0, 0, width, height);

      pushStyle();
      fill(0, eDif); 
      rect(0, 0, 600, 600);
      popStyle();

      if (eDif <255) {
        eDif +=2; 
        playlist[5].play();
      }
      if (playlist[5].position() == playlist[5].length()) {
        texto[17].dibujaCuadrotexto(textos[17], 255, 0);
      }
    } else if ( pantalla == 21 ) {

      image (fondo[11], 0, 0, width, height);

      texto[18].dibujaCuadrotexto(textos[18], 255, 0);
    } else if ( pantalla == 22 ) {

      image (fondo[11], 0, 0, width, height);

      texto[19].dibujaCuadrotexto(textos[19], 255, 0);
    } else if ( pantalla == 23 ) {

      image (fondo[11], 0, 0, width, height);

      pushStyle();
      fill(0, eDif); 
      rect(0, 0, 600, 600);
      popStyle();

      if (eDif <255) {
        eDif +=2;
      } else {
        texto[20].dibujaCuadrotexto(textos[20], 255, 0);
      }
    } else if ( pantalla == 24 ) {

      pushStyle();
      fill(0, eDif); 
      rect(0, 0, 600, 600);
      popStyle();

      playlist[6].play();

      if (playlist[6].position() == playlist[6].length()) {
        texto[21].dibujaCuadrotexto(textos[21], 255, 0);
      }
    } else if ( pantalla == 25 ) {

      juego.actualizaJuego();
    }
    //créditos. Podría ser una clase?
    else if ( pantalla == 26) {

      image (fondo[10], 0, 0, width, height);

      if (eDif < height + 350) {

        eDif +=1;
      } else if (eDif >= 340) {
        setup();
      }

      textSize(25);
      text("Diseñador: Joaquín Tramenelli Sugimori", 50, eDif-50);
      text("Desarrollador: Joaquín Tramenelli Sugimori", 50, eDif-150);
      text("Guionista: Joaquín Tramenelli Sugimori\ncon la ayuda de:\nGiuliana Tramenelli y Agostina Tramenelli", 50, eDif -300);
    }
    ////////////////////////////////////////////////////////////////////////////////////////

    //boton que reinicia el programa, mostrado todo el tiempo
    boton[16].rr = 80;
    boton[16].dibujaBoton("Menu", 550, 50, 80, 80);


    //monitorear en que pantalla se está
    if (DEBUG == true) {
      pushStyle();
      fill(0, 255, 0);
      textSize(20);
      text(pantalla, 30, 30);
      popStyle();
    }

    println(mouseX, " ..", mouseY);
  }


  void click() {

    juego.click();

    //aréa del boton menu para el reinicio del programa
    if (boton[16].colisionMouse()) {
      
      pantalla = 25;
      //setup();
    }

    if (pantalla == 0) {

      //botón para comenzar
      if (boton[0].colisionMouse() || boton[1].colisionMouse()) {

        pantalla = 1; 

        //botón créditos
      } else if (boton[2].colisionMouse()) {

        pantalla = 26;
      }
    } else if (pantalla == 1) {

      pantalla = 2; 

      if (loop1) {
        pantalla = 13;
      }
    } else if (pantalla == 2) {

      pantalla = 3;
    } else if (pantalla == 3) {

      pantalla = 4;
    } else if (pantalla == 4) {

      pantalla = 5;
    } else if (pantalla == 5) {

      pantalla = 6;
    } else if (pantalla == 6) {

      if (loop0) {
        pantalla = 13;
      } else {
        pantalla = 7;
      }
    } else if (pantalla == 7) {

      //boton abrir
      if (boton[3].colisionMouse()) {

        pantalla = 8;

        //boton mirar por la mirilla
      } else if (boton[4].colisionMouse()) {

        pantalla = 9;

        //boton ignorarlo
      } else if (boton[5].colisionMouse()) {

        pantalla = 10;
      }
    } else if (pantalla == 8) {

      setup();
      loop0 = true;
    } else if (pantalla == 9) {

      pantalla = 11;
    } else if (pantalla == 10) {

      setup();
      loop0 = true;
    } else if (pantalla == 11) {

      //abrir
      if (boton[6].colisionMouse()) {

        pantalla = 8;

        //llamar policia
      } else if (boton[7].colisionMouse()) {

        pantalla = 12;

        //ignorarlo
      } else if (boton[8].colisionMouse()) {

        pantalla = 10;
      }
    } else if (pantalla == 12) {

      setup();
      loop0 = true;
    } else if (pantalla == 13) {

      //Esconderse
      if (boton[9].colisionMouse()) {

        pantalla = 14;

        //Enfrentarlo
      } else if (boton[10].colisionMouse()) {

        pantalla = 15;

        //Escapar
      } else if (boton[11].colisionMouse()) {

        pantalla = 16;
      }
    } else if (pantalla == 14) {
      pantalla = 17;
    } else if (pantalla == 15) {

      //razonar con él
      if (boton[12].colisionMouse()) {

        pantalla = 21;
      } else if (boton[13].colisionMouse()) {

        //no hecha todavía
        pantalla = 25;
      }
    } else if (pantalla == 17) {

      //mantenerse escondido
      if (boton[14].colisionMouse()) {

        pantalla = 18;

        //atacarlo distraido
      } else if (boton[15].colisionMouse())

        pantalla = 19;
    } else if (pantalla == 18) {

      setup();
      loop1 = true;
    } else if (pantalla == 19) {

      pantalla = 20;
    } else if (pantalla == 20) {

      setup();
      loop1 = true;
    } else if (pantalla == 21) {

      pantalla =22;
    } else if (pantalla == 22) {

      pantalla =23;
    } else if (pantalla == 23) {

      pantalla =24;
    } else if (pantalla == 24) {

      setup();
      loop1 = true;
    }
  }

  void debug() {

    if (key == 'f') {
      DEBUG = !DEBUG;
    }
    //permite recorrer las pantallas
    if (key == 'e') {
      pantalla ++;
    } else if (key == 'q') {

      pantalla --;
    }
  }
}
