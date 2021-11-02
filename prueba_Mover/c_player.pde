class player {
  
  //propiedades (Variables del objeto)
  
  float x,y,mx,my,r;
  
  PImage steve;
  
  player(){
    
    r = 40;
    
    x = 300;
    y = 300;
    
    mx = 1;
    my = 1;
  
  }
  
  void dibujar(){
    
    pushMatrix();
    
    translate(x, y);
  
    steve = loadImage("steve.png");
    
    float ang = atan2(mouseY-y,mouseX-x);
    
    rotate(ang);
    
    imageMode(CENTER);
    
    image (steve, 0, 0);
  
    /*
    //área de colisión
    
    fill(255,100);
    noStroke();
   circle(0,0,r);
    */
   
    popMatrix();
    
  }
  
  void mover(){

    println(x + "," + y + "..." + mouseX + "," + mouseY);
     
    if(mouseX > x){
     
     x += mx;
      
    }else if ( x == mouseX){
      
     x = mouseX;
     
    }else{
    
     x -= mx;
    
    }
    if(mouseY > y){
     
      y += my;;
      
    }else if ( y == mouseY){
      
     y = mouseY;
     
    }else{
    
     y -= my;
    
    }
  }
}
