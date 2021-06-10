import ddf.minim.*;

Minim minim; 
AudioPlayer player;

//declaracion de variables
 PImage fondo5;
 PImage minecraftLogo2;
 PImage efectoOscuro;
 PFont miFuente; 
 int opacidadDI;
 int opacidadDF;
 int opacidadTI;
 int opacidadText;
 int moverY;
 int moverYT;
 int moverYFF;
 int timer;
 boolean inicio;
 boolean fin;

void setup() {

//asignacion de valores
  minim = new Minim(this);
  opacidadDI = 255;
  opacidadDF = 0;
  opacidadTI = 0;
  opacidadText = 255;
  moverY = 700;
  moverYT = 700;
  moverYFF = 700;
  timer = 0;
  inicio = false;
  fin = false;

  size(600, 600);
  
//carga de imagenes, sonido y tipografia
  player = minim.loadFile("Minecraft OST  Credits Song by C4182.mp3");
  fondo5 = loadImage("fondo5.png");
  minecraftLogo2 = loadImage("minecraftLogo2.png");
  efectoOscuro = loadImage("efectoBordeOscuro.png");
  miFuente = createFont("minecraft_font.ttf", 20);
  textFont(miFuente);
}

void draw() {

  background (0);

  println("timer:" + timer + "-moverY:" + moverY + "-opacidadTextoInicio:"
  + opacidadTI + "-moverYT:" + moverYT);

 //imagen de fondo
  image(fondo5, 0, 0, 600, 600);

//imagen para efecto bordes oscuros 
  pushStyle();
  tint(255, 100);
  image(efectoOscuro, 0, 0, 600, 600);
  popStyle();

//texto comenzar
  fill(255, opacidadTI);
  textSize(30);
  textAlign(CENTER);
  text("Presiona click para empezar", 300, 300);

//comienzo de creditos
  if (inicio) {
    opacidadTI -= 10;
    if (opacidadTI <= -10) {
      moverYT -= 3;
      timer ++;
      player.play();
    }
  } else {
    opacidadTI += 2;
    if (opacidadTI >=255) {
      opacidadTI = 255;
    }
  }

 //desaceleracion y frenado momentaneo del titulo
  if (moverYT <= 230 && timer <= 190) {
    moverYT = 230;
  } else if (moverYT < 240 && moverYT > 230) {
    moverYT += 1;
  } else if (moverYT < 230) {
    moverYT += 1;
  }

 //titulo del videojuego  
  image(minecraftLogo2, 20, moverYT, 1100/2, 183/2);

 //creditos
   if (moverYT < 230) {
     moverY -= 2;
     textAlign(LEFT);
     textSize(30);

    //titulos
    fill(200);
    text("Creador Original", 60, moverY-80);
    text("Director creativo jefe", 60, moverY+160);
    text("Productores", 60, moverY+400);
    text("Ingeniero Principal", 60, moverY+960);
    text("Desarolladores", 60, moverY+1200);
    text("Musica compuesta por", 60, moverY+ 2160);

    //personas
    fill(255);
    
     //Creador original
    text("Markus Persson (Notch)", 130, moverY);
    
     //Director creativo jefe
    text("Jens Bergensten (Jeb)", 130, moverY+240);

     //productores
    text("Adrian Ostergård", 130, moverY+480);
    text("Dejan Dimic", 130, moverY+560);
    text("Fredrik Telenius", 130, moverY+640);
    text("Isabella Arningsmark", 130, moverY+720);   

     //Ingeniero principal
    text("Nathan Adams", 130, moverY+1040);

     //desarrolladores
    text("Agnes Larsson", 130, moverY+1280);
    text("Bartosz Bok", 130, moverY+1360);
    text("Cory Scheviak", 130, moverY+1440);
    text("Erik Broes", 130, moverY+1520);
    text("Georgii Gavrichev", 130, moverY+1600);
    text("Josh Letellier", 130, moverY+1680);    
    text("Maria Lemon", 130, moverY+1760);
    text("Michael Stoyke", 130, moverY+1840);
    text("Thomas Guimbretiere", 130, moverY+1920); 

     //compositor
    text("Daniel Rosenfeld (C418)", 130, moverY+2240);
  }

//frase final
 if (timer >= 1600) {
    moverYFF --;
  }
  textAlign(CENTER);
  textSize(15);
  text("\"Cuando seas viejo, estaras mas decepcionado por las cosas\nque no hiciste que por las cosas que hiciste.\n Asi que suelta las amarras. Navega lejos del puerto seguro.\n Aprovecha los vientos favorables para tus velas.\nExplora. Desea. Descubre. -Desconocido\"", 300, moverYFF);
 if (moverYFF <= 100) {
    fin = true;
  }
  
/////////////////////////

//efecto difuminado inicial
  noStroke();
  fill(0, opacidadDI); 
  rect(0, 0, 600, 600);
  opacidadDI -= 3;

//efecto difuminado final y texto repetir
  if (fin) {
    opacidadDF += 2;
    noStroke();
    fill(0, opacidadDF); 
    rect(0, 0, 600, 600);
   
    fill(255, opacidadDF);
    textSize(20);
    textAlign(CENTER);
    text("Presiona una tecla para\n repetir los creditos", 300, 300);
  }
}

//funcion comenzar
void mouseClicked() { 
  inicio = true;
}

//funcion repetir
void keyPressed(){
  setup();
}
