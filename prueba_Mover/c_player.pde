class player {

  //propiedades (Variables del objeto)

  float x, y, mx, my, r;

  PImage steve;

  int numFrames = 12;

  int currentFrame = 0;

  PImage[] sprites = new PImage[numFrames];

  player() {

    for (int i = 0; i <numFrames; i++) {

      sprites[i] = loadImage("sprite_" + nf(i, 2) + ".png");
    }

    r = 40;

    x = 300;
    y = 300;

    mx = 2;
    my = 2;
  }

  void dibujar() {

    pushMatrix();

    translate(x, y);

    steve = loadImage("sprite_00.png");

    float angle = atan2(mouseY-y, mouseX-x);

    //float deg = degrees(angle);

    //println("grados:" + deg);

    rotate(angle);
    
    fill(255,50);

    rectMode(CENTER);
    //rect(0, 0, 68, 64);

    imageMode(CENTER);

    image (steve, 0, 0);

    popMatrix();
    
  }

  void disparo() {

    pushMatrix();
    pushStyle();

    translate(x, y);
    
    //wprintln("cFrame" + currentFrame);

    float angle = atan2(mouseY-y, mouseX-x);

    rotate(angle);
    
   if(disparando){
    if(currentFrame >= 11){
     currentFrame = 0; 
    disparando = false;
     
    }else{ currentFrame = (currentFrame+1) % numFrames;}
    
  }

    for (int i=0; i<1; i++) {

      image(sprites[(currentFrame)], 0, 0);

      popStyle();
      popMatrix();
    }
  }

  void mover() {
    
      println(mouseX, mouseY + "---" + x, y);

    if (keys['a']) { 
      x-=mx;
    }
    if (keys['d']) { 
      x+=mx;
    }
    if (keys['w']) { 
      y-=my;
    }
    if (keys['s']) { 
      y+=my;
    }
  }
  
  void colisionPared(){
    
    
   if(p == 0){
    if(x <= 150 && y <= 230){
      
      if( x >=150){
     
      x = x+2;
      
      }if (y >= 230){
      y = y+2;
      }
      
    }else if (x >= 450 && y <= 230){
      
      if(x <= 450){
      
      x = x-2;
      
      }if( y >= 230){
      
      y = y+2;
      
      }
      
    }else{
     
      mx = 2;
      
      my = 2;
      
    }
   }
    
  }

  void pasarN () {

    if (p == 0) {

      if ( y < 70) {
        p = 1;

        y = 500;
      }
    } else if (p == 1) {

      if ( y > 550) {

        p = 0;

        y = 120;
      }
    }
  }
}
