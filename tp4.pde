/*
Joaquín Tramenelli Sugimori - 88314/3
Comision 3 - David Bedoian
Trabjao Práctico 4 
7/10/2021
*/
 
//declaración de variables

import ddf.minim.*;
 
Minim minim;
 
AudioPlayer[] playlist;

int pantalla;

int eDif;

boolean loop;

boolean DEBUG = false;

//creación del array que guarde las lineas de texto 

String[] textos;

//creación del array que guarde las imágenes

PImage[] fondo = new PImage [11]; 


void setup() {
  
  //asignacion de valores a las variables
  
  loop = false;

  pantalla = 0;
  
  eDif = 0;
  
  //creación de las casillas que guarden los archivos de sonido
  playlist = new AudioPlayer[5];
  
  minim = new Minim(this);

  //carga del archivo de texto mediante estructura for
  textos = loadStrings("data/Textos.txt");
  
  for( int i=0 ; i<11; i++){
    
  fondo[i]  = loadImage ("img_" + nf(i,2) + ".png");

  }
  //carga de los archivos de sonido mediante estructura for
  for( int i=0 ; i<5; i++){
    
  playlist[i] = minim.loadFile ("sonido_" + nf(i,2) + ".mp3");

  }
  
  size(600, 600);
  
}

void draw() {

  println(loop + "--" + "contador" + eDif);
  println(textos.length);
  
  
//pantallas y su lógica de representación de las imágenes y dibujos
  if (pantalla == 0) {
    
    image (fondo[0], 0,0,width,height);
    
    if(loop){
     dibujaBoton("Continuar...", 300, 250, 275, 125, 20);
    }else{
     dibujaBoton("Empezar", 300, 250, 250, 100, 60);
    }
    
    dibujaBoton("Créditos", 300, 450, 150, 100, 80);
    
  } else if ( pantalla == 1 ) {
    
    playlist[0].play();

    image (fondo[1], 0,0,width,height);
    
    if(loop){
    contenedorTexto(textos[9],0, 255);
    }else{
    contenedorTexto(textos[0],0, 255);
    }

  } else if ( pantalla == 2 ) {
    
    image (fondo[1], 0,0,width,height);
    
     if(loop){
    contenedorTexto(textos[10],0, 255);
    }else{
    contenedorTexto(textos[1],0, 255);
    }
     
  }else if ( pantalla == 3 ) {
    
    image (fondo[1], 0,0,width,height);
    
     if(loop){
    contenedorTexto(textos[11],0, 255);
    }else{
    contenedorTexto(textos[2],0, 255);
    }
     
  }else if ( pantalla == 4 ) {
    
    image (fondo[2], 0,0,width,height);
    
     if(loop){
    contenedorTexto(textos[12],0, 255);
    }else{
    contenedorTexto(textos[3],0, 255);
    }
     
  }else if ( pantalla == 5 ) {
    
    image (fondo[3], 0,0,width,height);
    
     if(loop){
    contenedorTexto(textos[13],0, 255);
    }else{
    contenedorTexto(textos[4],0, 255);
    }
     
  }else if ( pantalla == 6 ) {
    
    playlist[1].play();
    
    image (fondo[3], 0,0,width,height);
    
     if(loop){
    contenedorTexto(textos[14],0, 255);
    }else{
    contenedorTexto(textos[5],0, 255);
    }
     
  }else if ( pantalla == 7 ) {
    
    image (fondo[3], 0,0,width,height);
    
    dibujaBoton("Abrir la puerta", 300, 200, 200, 70, 60);
    dibujaBoton("Mirar por la mirilla", 300, 300, 250, 70, 60);
    dibujaBoton("Ignorarlo y seguir durmiendo", 300, 400, 340, 70, 60);
    
  }else if ( pantalla == 8 ) {
    
    image (fondo[3], 0,0,width,height);

    eDif +=4; 
    
    pushStyle();
    fill(0, eDif); 
    rect(0, 0, 600, 600);
    popStyle();
    
    playlist[2].play();
    
    if(eDif >= 280){
     playlist[3].play(); 
     contenedorTexto(textos[6], 255, 0);
    }

  }else if ( pantalla == 9 ) {
    
    image (fondo[4], 0,0,width,height);
    
  }else if ( pantalla == 10 ) {
    
    image (fondo[5], 0,0,width,height);
    
    playlist[4].play();
    
    eDif +=4; 
    
    pushStyle();
    fill(0, eDif); 
    rect(0, 0, 600, 600);
    popStyle();
    
    if(eDif >255){ 
    playlist[3].play();
    contenedorTexto(textos[7], 255,0);
    }

  }else if ( pantalla == 11 ) {
    
    image (fondo[5], 0,0,width,height);
    
    dibujaBoton("Abrir", 300, 200, 200, 70, 60);
    dibujaBoton("Llamar a la policía", 300, 300, 250, 70, 60);
    dibujaBoton("Esperar que se valla", 300, 400, 340, 70, 60);
    
  }else if ( pantalla == 12 ) {
    
    image (fondo[5], 0,0,width,height);
    
    playlist[4].play();
    
    eDif +=4; 
    
    pushStyle();
    fill(0, eDif); 
    rect(0, 0, 600, 600);
    popStyle();
    
    if(eDif >255){ 
    playlist[3].play();
    contenedorTexto(textos[8], 255,0);
    }
    
  }else if ( pantalla == 13 ) {
    
    image (fondo[5], 0,0,width,height);
    
    dibujaBoton("Esconderte", 300, 200, 200, 70, 60);
    dibujaBoton("Enfrentarlo", 300, 300, 250, 70, 60);
    dibujaBoton("Escapar", 300, 400, 340, 70, 60);
    
  }else if ( pantalla == 14 ) {
    
    image (fondo[6], 0,0,width,height);

    contenedorTexto(textos[15], 255,0);
    
  }else if ( pantalla == 15 ) {
    
    image (fondo[5], 0,0,width,height);
    
    dibujaBoton("Esconderte", 300, 200, 200, 70, 60);
    dibujaBoton("Enfrentarlo", 300, 300, 250, 70, 60);
    dibujaBoton("Escapar", 300, 400, 340, 70, 60);
    
  }else if ( pantalla == 16 ) {
    
    image (fondo[5], 0,0,width,height);
    
    dibujaBoton("Esconderte", 300, 200, 200, 70, 60);
    dibujaBoton("Enfrentarlo", 300, 300, 250, 70, 60);
    dibujaBoton("Escapar", 300, 400, 340, 70, 60);
    
  }else if ( pantalla == 17 ) {
    
    image (fondo[7], 0,0,width,height);
    
    playlist[4].play();
    
    if(eDif >= 50){
      
    dibujaBoton("Mantenerse quieto", 300, 200, 200, 70, 60);
    dibujaBoton("Atacarlo distraído", 300, 300, 250, 70, 60);
    
    }else{
     eDif ++; 
    }
    
  }else if ( pantalla == 18 ) {
    
    if(eDif <=255){
      eDif +=2;
    }else{
      
    playlist[3].play();
    
    pushStyle();
    fill(0, eDif); 
    rect(0, 0, 600, 600);
    popStyle();
    
    }
    pushStyle();
    tint(eDif);
    image (fondo[8], 0,0,width,height);
    popStyle();
    
  }else if ( pantalla == 19 ) {
    
    image (fondo[9], 0,0,width,height);
    
    contenedorTexto(textos[16], 255,0);
    
  }else if ( pantalla == 20 ) {
    
    image (fondo[9], 0,0,width,height);
    
    pushStyle();
    fill(0, eDif); 
    rect(0, 0, 600, 600);
    popStyle();
  
    if(eDif <=255){
    eDif +=2; 
    }else{
     contenedorTexto(textos[17], 255,0);
    }
    
  }
  
  //créditos
  else if ( pantalla == 21 ) {
    
    image (fondo[10], 0,0,width,height);
    
    if(eDif < height + 350){
      
     eDif +=1; 
    }else if (eDif >= 340){
   pantalla = 0; 
  }
    
    textSize(25);
    text("Diseñador: Joaquín Tramenelli Sugimori", 50, eDif-50);
    text("Desarrollador: Joaquín Tramenelli Sugimori", 50, eDif-150);
    text("Guionista: Joaquín Tramenelli Sugimori\ncon la ayuda de:\nGiuliana Tramenelli y Agostina Tramenelli", 50, eDif -300);
    
  }
////////////////////////////////////////////////////////////////////////////////////////

  //boton que reiniciar el programa, mostrado todo el tiempo
  dibujaBoton("Menu", 550, 50, 80, 80, 100);

  //monitorear en que pantalla se está

  if (DEBUG == true) {

    fill(0, 255, 0);
    textSize(20);
    text(pantalla, 30, 30);
  }
  
   println(mouseX, " ..", mouseY);
   
}

////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////

void mouseClicked() {

  //aréa del boton menu para el reinicio del programa
  if (colisionMouse (550+40, 550-40, 50-40, 50+40)) {
    setup();
  }

  if (pantalla == 0) {
    
    //botón para comenzar
    if (colisionMouse (300+125, 300-125, 250-50, 250+50)) {

      pantalla = 1; 
      
      //300, 450, 150, 100, 80
    }else if(colisionMouse(300+75, 300-75, 450-50, 450+50)){
     
      pantalla = 21;
     
    }
   }else if (pantalla == 1){
      
     pantalla = 2; 
   
  }else if (pantalla == 2){
      
     pantalla = 3;

  }else if (pantalla == 3){
      
     pantalla = 4;

  }else if (pantalla == 4){
      
     pantalla = 5;

  }else if (pantalla == 5){
      
     pantalla = 6;

  }else if (pantalla == 6){
      
    if(loop){
     pantalla = 13; 
    }else{
     pantalla = 7;
    }

  }else if (pantalla == 7){
      
    //abrir
    if (colisionMouse (300+100, 300-100, 200-35, 200+35)) {
      
      pantalla = 8;
    
    //mirar por la mirilla
    }else if (colisionMouse (300+125, 300-125, 300-35, 300+35)) {
      
      pantalla = 9;

    //ignorarlo
    }else if (colisionMouse (300+170, 300-170, 400-35, 400+35)) {
      
      pantalla = 10;
      
    }
  }else if (pantalla == 8){
    
    setup();
    loop = true;
    
  }else if (pantalla == 9){
      
      pantalla = 11;
    
  }else if (pantalla == 10){
    
    setup();
    loop = true;
    
  }else if (pantalla == 11){
      
     //abrir
     if (colisionMouse (300+100, 300-100, 200-35, 200+35)) {
      
     pantalla = 8;
    
     //llamar policia
     }else if (colisionMouse (300+125, 300-125, 300-35, 300+35)) {
      
      pantalla = 12;

     //ignorarlo
     }else if (colisionMouse (300+170, 300-170, 400-35, 400+35)) {
      
     pantalla = 10;
      
    }
    
  }else if (pantalla == 12){
    
    setup();
    loop = true;
    
  }else if (pantalla == 13){
      
     //Esconderse
     if (colisionMouse (300+100, 300-100, 200-35, 200+35)) {
      
     pantalla = 14;
    
     //Enfrentarlo
     }else if (colisionMouse (300+125, 300-125, 300-35, 300+35)) {
      
      pantalla = 15;

     //Escapar
     }else if (colisionMouse (300+170, 300-170, 400-35, 400+35)) {
      
     pantalla = 16;
      
    }
    
  }else if (pantalla == 14){
    pantalla = 17;
    
  }else if (pantalla == 17){
    
    //mantenerse escondido
    if (colisionMouse (300+100, 300-100, 200-35, 200+35)){
       
      pantalla = 18;
      
    //atacarlo distraido  
    }else if (colisionMouse (300+125, 300-125, 300-35, 300+35))
    
      pantalla = 19;
     
  }else if (pantalla == 18){
      
    setup();
    loop = true;
    
  }else if (pantalla == 19){
    
    pantalla = 20;
    
  }else if (pantalla == 20){
    
    setup();
    loop = true;
    
  }
  
}

//tecla para activar el DEBUG para monitorear las pantallas 
void keyPressed() {

  if(key == 'f'){
  DEBUG = !DEBUG;
  }
  //teclas flecha izquierda y derecha para el desplazamiento entre pantallas
  if(key == CODED){
     if(keyCode == RIGHT){
      
       pantalla ++;
       
     }else if (keyCode == LEFT){
       
      pantalla --;
      
     }
   }
}
