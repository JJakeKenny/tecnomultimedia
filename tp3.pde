/*
Joaquín Tramenelli Sugimori - 88314/3
Comision 3 - David Bedoian
Trabajo Practico N°3: Ilusión Óptica Interactiva
*/

//declaración de variables
int cantCX, cantCY;
int cantLR;
float modX, modY;

float s;

int strokeW;

int colorLR1;
int colorLG1;
int colorLB1;
int colorLR2;
int colorLG2;
int colorLB2;

float tX;

void setup(){
  
size(600,600);

//asignación de valores iniciales

 //colores de los cuadrados
colorLR1 = 255;
colorLG1 = 255;
colorLB1 = 0;

colorLR2 = 0;
colorLG2 = 0;
colorLB2 = 255;

 //escala de la pantalla
s = 1;

 //posición de los elementos y el 0,0
tX = width/2; 
 
 //valores de for
cantCX = 4;
cantCY = 3;

cantLR = 4;

 //cálculo de módulos
modX = (float) width/cantCX;
modY = (float) height/cantCY;
}

void draw(){
  
  //cambia el tamaño de las líneas en relación al mouse, para aumentar o disminuir el efecto óptico
  strokeW = (int) constrain(map(mouseX, 100, 500, 5, 0.1),0.1,5);
  
  background(255);

  //mueve el 0,0 al centro de la pantalla
  translate(tX, height/2);
  
  scale(s);
  
//lineas amarillas
  for(int a=0; a<2; a++){
   for(int j=0; j<cantLR; j++){
    for(int i=0; i<14; i++){

    pushMatrix();
    pushStyle();
    //mantiene las líneas en una posición fija aunque se cambie el 0,0
    translate(-width/2,-height/2);
    //cambia el color de las líneas para que en la otra columna se superponga la línea opuesta
    if ( a%2 == 0){
      stroke(colorLR2,colorLG2,colorLB2);
    }else{   
      stroke(colorLR1,colorLG1,colorLB1);
    }
    strokeWeight(strokeW);
    line(140/14*i+10+(modX*j), modY*a+225, 140/14*i+10+(modX*j), modY*a+375);
    
    popStyle();
    popMatrix();
    
     }
   }
 }
 
//cuadrados de colores
   for(int i=0; i<cantCY; i++){ 
    for(int a=0; a<cantCX; a++){
   
    pushMatrix();
    pushStyle();
    
    //cambia el modo de color a HSB para poder recorrer el espectro crómatico
    colorMode(HSB);
    //declaro variable temporal de color para que cambie con for
    color color1 = color( map(a, 0, cantCX+1, 0, 255), 255,255);
    fill(color1);
    translate(-width/2,-height/2);
    noStroke();
    rectMode(CENTER);
    rect(modX*a+75, modY*i+100, 100, modY/2);
    
    popStyle();
    popMatrix();
  }
 }
  
//lineas azules
 for(int i=0; i<2; i++){
  for(int j=0; j<cantLR; j++){
   for(int a=0; a<15; a++){
  
    pushMatrix();
    pushStyle();
    
    translate(-width/2,-height/2);
    
    //cambia el color de las líneas para que en la otra columna se superponga la línea opuesta
    if ( i%2 == 0){
      stroke(colorLR1,colorLG1,colorLB1);
    }else{   
      stroke(colorLR2,colorLG2,colorLB2);
    }
    strokeWeight(strokeW);
    line(modX/15*a+5+(modX*j), modY*i+225, modX/15*a+5+(modX*j), modY*i+375);
    
    popStyle();
    popMatrix();
   }
  }
 } 
 
//Función restart, reinica el programa
 if(keyPressed){
  
   if(key == 'r' || key == 'R'){
   setup(); 
 }
}
  println("colores:" + colorLR1,colorLG1,colorLB1 + ",,," + colorLR2,colorLG2,colorLB2);  
  println("mouse:" + mouseX + ".." + mouseY + "division:");
}

//Generación de más módulos en relación al mouse
void mouseDragged(){
 
  //efecto de "scroll" lateral
  tX = map(mouseX, 100, 500, 100, 400);

  //efecto de "zoom out" al bajar la escala en relación al mouse
  s = constrain(map(mouseX, 100,500, 0.5, 1),0.5,1);
  
  //aumento de modulos (cuadrados y líneas)
  cantCX = int(constrain(map(mouseX, 250,350, 12,4),4,12));
  cantLR = int(constrain(map(mouseX, 200,400, 12,4),4,12));
}

//randomización del color de las líneas al presionar una tecla cualquiera
void keyPressed(){
 
  colorLR1 = int(random(0,255));
  colorLG1 = int(random(0,255));
  colorLB1 = int(random(0,255));
  
  colorLR2 = int(random(0,255));
  colorLG2 = int(random(0,255));
  colorLB2 = int(random(0,255));

}
  
  
  
  
