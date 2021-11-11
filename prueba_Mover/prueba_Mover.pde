
player yo;

Pantalla cPantalla;

Bala disparo;

float mX, mY;

int p;

PImage nivel, nivel1, steve;

boolean [] keys = new boolean[255];

boolean disparando;

boolean bala;

void setup(){
  
 size(600,600); 
 
 mX = 0;
 
 mY = 0;
 
 disparando = false;
 
 bala = false;
 
 yo = new player();
 
 cPantalla = new Pantalla();
 
 disparo = new Bala();
 
 steve = loadImage("steve.png");
 
 nivel = loadImage("nivel.png");
 
 nivel1 = loadImage("nivel1.png");
 }
 
 
void draw(){
  
  println(disparando + "---" + mX + ";" + mY);
  
 background(255,120,120); 
 
 cPantalla.cambiaPantalla();
 
 yo.pasarN();
 yo.mover();
 yo.colisionPared();
 
 disparo.dibujaDisparo();
 disparo.viajeDisparo();
 
 if(disparando){
  
   yo.disparo();
   
 }else{
   
   yo.dibujar();

 }
  
}

void mousePressed(){
 
  disparando = true;
  
  bala = true;
  
  mX = mouseX;
  
  mY = mouseY;
  
}
void keyPressed(){
 
  keys[key] = true;

}
void keyReleased(){
 
  keys[key] = false;

}
