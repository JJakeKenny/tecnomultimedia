/*
 Joaquín Tramenelli Sugimori - 88314/3
 Comision 3 - David Bedoian
 Trabjao Práctico 5
 video presentación: https://youtu.be/4qZhwjJF_OY
 18/11/2021
 */

//declaración de la clase principal Juego
Juego juego;

void setup() {

  size(600, 600); 

  //construcción del objeto juego
  juego = new Juego();
}


void draw() {

  background(255, 120, 120); 

  //función principal del programa, se encarga de mostrar todos los elementos
  juego.actualizaJuego();
}


//ejecuta la función click que permite disparar
void mousePressed() {

  juego.click();
}
void keyPressed() {

  juego.teclaApretada();
}
void keyReleased() {

  juego.teclaSoltada();
}
