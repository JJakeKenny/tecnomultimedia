/*
 Joaquín Tramenelli Sugimori - 88314/3
 Comision 3 - David Bedoian
 Trabajo final
 video presentación: 
 /11/2021
 */

import ddf.minim.*;

Minim minim;

AudioPlayer[] playlist;

Aventura aventura;

Juego juego;

boolean loop0;
boolean loop1;

void setup() {

  loop0 = false;
  loop1 = false;

  aventura = new Aventura();

  juego = new Juego();

  //creación de las casillas que guarden los archivos de sonido
  playlist = new AudioPlayer[7];

  minim = new Minim(this);

  //carga de los archivos de sonido mediante estructura for
  for ( int i=0; i<7; i++) {

    playlist[i] = minim.loadFile ("sonido_" + nf(i, 2) + ".mp3");
  }

  size(600, 600);
}

void draw() {

  aventura.actualizaAventura();
}


void mousePressed() {

  aventura.click();
}

void keyPressed() {

  aventura.debug();

  juego.teclaApretada();
}

void keyReleased() {

  juego.teclaSoltada();
}
