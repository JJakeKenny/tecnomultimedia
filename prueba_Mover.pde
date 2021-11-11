
player yo;

Pantalla cPantalla;

int p;

PImage nivel, nivel1, steve;

boolean [] keys = new boolean[255];

boolean disparando;

void setup(){
  
 size(600,600); 
 
 disparando = false;
 
 yo = new player();
 
 cPantalla = new Pantalla();
 
 steve = loadImage("steve.png");
 
 nivel = loadImage("nivel.png");
 
 nivel1 = loadImage("nivel1.png");
 }
 
 
void draw(){
  
  println(disparando);
  
 background(255,120,120); 
 
 yo.pasarN();
    
 //ejecuta las funcionalidades de tito (lo dibuja y lo mueve)
 
 cPantalla.cambiaPantalla();
 
 yo.mover();
 
 yo.colisionPared();
 
 if(disparando){
  
   yo.disparo();
   
 }else{
   
   yo.dibujar();

 }
  
}

void mousePressed(){
 
  disparando = true;
  
}
void keyPressed(){
 
  keys[key] = true;

}
void keyReleased(){
 
  keys[key] = false;

}
