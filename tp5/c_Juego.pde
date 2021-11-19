class Juego {

  //declaración de clases, objetos y variables
  
  Player yo;

  Enemigo en;

  Pantalla cPantalla;

  Bala disparo;

  Bala disparoEn;

  Camion camionA;

  Camion camionB;

  Boton boton0, boton1;

  Obstaculo [] papel;

  Texto texto0, texto1, texto2, texto3, texto4, texto5, texto6, texto7, texto8;

  String[] textos;

  //creación de un array de booleanos para detectar correctamente las teclas
  boolean [] keys = new boolean[255];

  boolean disparando;

  boolean arma;

  boolean DEBUG;

  boolean muerto;

  PFont miFuente; 

  Juego() {

    //carga de archivo de texto.txt para el array de textos
    textos = loadStrings("data/textos.txt");

    disparando = false;

    DEBUG = false;

    muerto = false;

    arma = false;

    //construcción de los objetos
    yo = new Player();

    en = new Enemigo();

    cPantalla = new Pantalla();

    disparo = new Bala();

    disparoEn = new Bala();

    camionA = new Camion();

    camionB = new Camion();

    papel = new Obstaculo[4];

    for ( int i=0; i<papel.length; i++) {
      papel[i] = new Obstaculo(random(200, 400), i*350/papel.length + 150);
    }

    boton0 = new Boton("Comenzar", 300, 270, 300, 100);

    boton1 = new Boton("Reiniciar", 300, 350, 300, 100);

    texto0 = new Texto(textos[0], 300, 100, 60, 255);

    texto1 = new Texto(textos[1], 300, 200, 20, 255);

    texto2 = new Texto(textos[2], 300, 420, 15, 30);

    texto3 = new Texto(textos[3], 300, 100, 70, 255);

    texto4 = new Texto(textos[4], 300, 350, 30, 255);

    texto5 = new Texto(textos[5], 300, 420, 20, 230);

    texto6 = new Texto(textos[6], 300, 200, 20, 255);

    texto7 = new Texto(textos[7], 300, 430, 15, 0);

    texto8 = new Texto(textos[8], 300, 200, 20, 255);

    //carga de la fuente personalizada
    miFuente = createFont("tipografia.TTF", 20);

    textFont(miFuente);
  }

  //Función principal del programa, sirve para ejcutar constamtente las demás funciones
  void actualizaJuego() {

    //llamado de funciones de los objetos

    //se encarga de llevar una lógica de estados para mostrar cada elemento
    cPantalla.cambiaPantalla();

    disparo.dibujaDisparo();
    disparo.viajeDisparo();

    disparoEn.dibujaDisparo();
    disparoEn.viajeDisparo();

    if (muerto == false) {
      if (arma) {
        if (disparando) {
          yo.disparo();
        } else { 
          yo.conArma();
        }
      } else if (arma == false) {
        yo.dibujar();
      }

      yo.pasarN();
      yo.mover();
      yo.colisionPared();
    } else {
      yo.muerto();
    }

    //herramienta de debug, permite ver la pantalla actual
    if (DEBUG == true) {

      pushStyle();
      fill(0, 255, 0);
      textSize(20);
      text(cPantalla.p, 30, 30);
      popStyle();
    }
  }

  //función de disparo
  void click() {

    disparando = true;

    disparo.posicionInicial(yo.px, yo.py, yo.pAngle);
  }

  //función para detectar que tecla se presiono
  void teclaApretada() {

    keys[key] = true;

    //tecla que activa la herramienta DEBUG
    if (key == 'f') {
      DEBUG = !DEBUG;
    }
    //permite recorrer las pantallas
    if (key == 'e') {
      cPantalla.p ++;
    } else if (key == 'q') {

      cPantalla.p --;
    }
  }

  //función para detectar que tecla se dejo de presionar
  void teclaSoltada() {

    keys[key] = false;
  }
}
