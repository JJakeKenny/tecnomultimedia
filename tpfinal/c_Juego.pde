class Juego {

  //declaración de clases, objetos y variables

  Player yo;

  Pantalla cPantalla;

  Bala disparo;

  Bala disparoEn;

  //creación de un array de booleanos para detectar correctamente las teclas
  boolean [] keys = new boolean[255];

  boolean disparando;

  boolean arma;

  boolean DEBUG;

  boolean muerto;

  Juego() {

    disparando = false;

    DEBUG = false;

    muerto = false;

    arma = false;

    //construcción de los objetos
    yo = new Player();

    cPantalla = new Pantalla();

    disparo = new Bala();

    disparoEn = new Bala();
  }

  //Función principal del programa, sirve para ejcutar constamtente las demás funciones
  void actualizaJuego() {

    pushStyle();

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
