/*
alumno: Joaquin Tramenelli Sugimori
legajo: 88314/3
fecha:27/4/2021
trabajoPractico: tp1 - Circulo cromático
comision: 3
*/

//declaracion de fuente personalizada
PFont miFuente;  

void setup() {
 
 size(600,600);

//fuente personalizada
miFuente = loadFont ("SegoeUI-Light-48.vlw");
textFont (miFuente,32);

}

void draw() {
  
  background(255);
  
  noStroke();
  
  /////////////////////////////////////////////////////////////
  
  //triangulos de colores (los que forman el circulo cromático)
  
   //colores primarios
   
    //rojo
  fill(255,0,0);
  triangle(250,100,352,100,300,300);
  
    //verde
  fill(0,255,0);
  triangle(500,350,447,450,300,300);
   
    //azul
  fill(0,0,255);
  triangle(150,450,100,347,300,300);
  
   //colores secundarios
  
    //amarillo
  fill(255,255,0);
  triangle(450,150,503,253,300,300);
  
    //cian
  fill(0,255,255);
  triangle(350,500,247,500,300,300);
  
    //magenta
  fill(255,0,255);
  triangle(153,150,100,250,300,300);
  
   //colores terciarios
   
    //naranja
  fill(255,126,0);
  triangle(350,100,453,150,300,300);
  
    //lima
  fill(126,255,0);
  triangle(500,250,503,353,300,300);
  
    //violeta
  fill(126,0,255);
  triangle(100,350,100,247,300,300);
  
    //fucsia
  fill(255,0,126); 
  triangle(253,100,150,150,300,300);
  
    //azul verdoso
  fill(0,255,126);
  triangle(450,450,347,500,300,300);
 
    //azul violaceo
  fill(0,126,255);
  triangle(250,500,147,450,300,300);
  
/////////////////////////////////////////////////////////////

  //circulos blancos, estan para redondear las puntas de los triangulos y darle el aspecto circular a la imagen


  //circulo externo (cubre las puntas exteriores, las que estan mas alejadas del centro)
  pushStyle();
  
  stroke(255);      
  strokeWeight(25);  
  noFill();
  circle(300,300,400);
 
  popStyle();
  
  //circulo central (cubre las puntas interiores, las que estan llendo hacia el centro)
  pushStyle();
  
  noStroke();
  fill(255);
  circle(300,300,200);
  
  popStyle();
  
  /////////////////////////////////////////////////////////////
  
  //Nombres de los colores
  pushStyle();
  
  fill(0);
  textAlign(CENTER);
  
  text("Rojo",300,70);
  text("Naranja",450,105);
  text("Amarillo",530,180);
  text("Lima",530,280);
  text("Verde",530,388);
  text("Azul verdoso",490,512);
  text("Cian",300,550);
  text("Azul violaceo",110,512);
  text("Azul",70,388);
  text("Violeta",55,280);
  text("Magenta",70,180);
  text("Fucsia",160,105);
  
  popStyle();
  
  /////////////////////////////////////////////////////////////
  
  //puntos de colores (esteticos)
  
  pushStyle();
  
  strokeWeight(20);
  stroke(255,0,0);//rojo
  point(300,100);
  stroke(255,126,0);//naranja
  point(400,125);
  stroke(255,255,0);//amarillo
  point(475,200);
  stroke(126,255,0);//lima
  point(500,300);
  stroke(0,255,0);//verde
  point(475,400);
  stroke(0,255,126);//azul verdoso
  point(400,475);
  stroke(0,255,255);//cian
  point(300,500);
  stroke(0,126,255);//azul violaceo
  point(200,475);
  stroke(0,0,255);//azul
  point(125,400);
  stroke(126,0,255);//violeta
  point(100,300);
  stroke(255,0,255);//magenta
  point(125,200);
  stroke(255,0,126);//fucsia
  point(200,125);
  
  popStyle();
  
  /////////////////////////////////////////////////////////////
  
  //forma del centro (marca los colores primarios y secundarios)
 
   //triangulo central (indica los colors primarios)
  triangle(213,350,385,350,300,200); 
  
    //triangulos rojos interiores centrales
  fill(255,0,0);
  triangle(257,275,343,275,300,200); 
  triangle(257,275,343,275,300,300);
  
    //triangulos azules interiores centrales
  fill(0,0,255);
  triangle(257,275,213,350,300,350);
  triangle(256,274,300,360,300,300);
  
    //triangulos verdes interiores centrales
  fill(0,255,0);
  triangle(343,275,300,350,385,350);
  triangle(344,274,300,360,300,300);
  
  //triangulos adyacentes (indican los colores secundarios)
  
   //triangulo izquierdo (magenta)
  fill(255,0,255);
  triangle(214,350,212,250,300,201); 
  
   //triangulo derecho (amarillo)
  fill(255,255,0);
  triangle(385,350,387,250,300,200); 
  
   //triangulo debajo (cian)
  fill(0,255,255);
  triangle(215,350,385,350,300,400); 
  
  /////////////////////////////////////////////////////////////
  

 
 
}
