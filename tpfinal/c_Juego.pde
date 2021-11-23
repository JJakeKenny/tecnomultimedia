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
  
  Texto[] texto;

  Texto texto0, texto1, texto2, texto3, texto4, texto5, texto6, texto7, texto8;

  String[] textos;

  //creación de un array de booleanos para detectar correctamente las teclas
  boolean [] keys = new boolean[255];

  boolean disparando;

  boolean arma;

  boolean DEBUG;

  boolean muerto;

  PFont miFuente; 
  
  int cantTextos;

  Juego() {
    
    cantTextos = 9;

    //carga de archivo de texto.txt para el array de textos
    textos = loadStrings("data/textosJuego.txt");
    
    texto = new Texto[cantTextos];
    
    for ( int i=0; i<cantTextos; i++) {
      texto[i] = new Texto();
    }

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

   boton0 = new Boton();
   
   boton1 = new Boton();

    //carga de la fuente personalizada
    miFuente = createFont("tipografia.TTF", 20);
  }

  //Función principal del programa, sirve para ejcutar constamtente las demás funciones
  void actualizaJuego() {
    
    pushStyle();
    
    textFont(miFuente);

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
    
    popStyle();
  }

  //función de disparo
  void click() {

    disparando = true;

    disparo.posicionInicial(yo.px, yo.py, yo.pAngle);
  }

  //función para detectar que tecla se presiono
  void teclaApretada() {

    keys[key] = true;

/*
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
    
    */
  }

  //función para detectar que tecla se dejo de presionar
  void teclaSoltada() {

    keys[key] = false;
  }
}
