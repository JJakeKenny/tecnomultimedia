
player yo;

PImage steve;

void setup(){
  
 size(600,600); 
 
 yo = new player();
 
 steve = loadImage("steve.png");
 
 }
 
 
void draw(){
  
 background(255,120,120); 
 
 //ejecuta las funcionalidades de tito (lo dibuja y lo mueve)
 
 yo.dibujar();
 yo.mover();
  
}
