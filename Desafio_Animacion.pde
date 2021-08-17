/*
Joaquín Tramenelli Sugimori - 88314/3
Comision 3 - David Bedoian
Desafio Animación
17/8/2021
*/

int numFrames = 6;
int currentFrame = 0;

int cantAbejas = 5;

PImage[] images = new PImage[numFrames];

float[] moveX = new float[cantAbejas];
float[] velX = new float[cantAbejas];

float modY;

void setup() {

  frameRate(12);

  for (int i = 0; i < cantAbejas; i++) { 
  moveX[i] = i-256; 
  
  velX[i] = 5 + i*random(2,10);
}

  images[0]  = loadImage("sprite_0.png");
  images[1]  = loadImage("sprite_1.png"); 
  images[2]  = loadImage("sprite_2.png");
  images[3]  = loadImage("sprite_3.png"); 
  images[4]  = loadImage("sprite_4.png");
  images[5]  = loadImage("sprite_5.png"); 

  size(600, 600);

}

void draw() {
  
  modY = (float) height/cantAbejas;

  background(0, 155, 155);

  currentFrame = (currentFrame+1) % numFrames;  

   for (int i=0; i<cantAbejas; i++) {

    image(images[(currentFrame)], moveX[i], modY*i, constrain(32*i+32,32,256), constrain(32*i+32,32,256));
    
   if (moveX[i] > width) {
    moveX[i] = -256;
  }else{
   moveX[i] += velX[i];
  }
  
  }
  println(moveX);
  
}


void mousePressed(){
 
  cantAbejas++;
  
  moveX = new float [cantAbejas];
  velX = new float[cantAbejas];
  
  for (int i = 0; i < cantAbejas; i++) { 
  moveX[i] = i-256; 
  
  velX[i] = 5 + i*random(2,10);
}
}
