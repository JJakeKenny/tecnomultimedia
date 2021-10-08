
//botones interactuables
void dibujaBoton ( String l_, float x_, float y_, float rx_, float ry_, float rr_) {

  pushStyle();
  pushMatrix();

  translate(x_, y_); 
  
  rectMode(CENTER);
  stroke(255,50);
  strokeWeight(5);
  fill(0,230);
  rect(0, 0, rx_, ry_, rr_);
  
  fill(255);

  textAlign(CENTER, CENTER);
  textSize(20);
  text(l_, 0, 0);

  popMatrix();
  popStyle();
}

//cuadros donde va a ir el texto
void contenedorTexto (String t_, color rC_, color tC_) {

  pushMatrix();
  pushStyle();

  translate(300,500); 

  rectMode(CENTER);
  fill(rC_,200);
  rect(0, 0, 550, 150, 20);

  fill(tC_);
  textSize(18);
  text(t_, 0,0,530,140);
  
  popMatrix();
  
  popStyle();
}

//detectar colision del mouse con una superficie cuadrada
boolean colisionMouse(float rSE_, float rSO_, float rSN_, float rSS_) {

  if ( mouseX < rSE_ && mouseX > rSO_ && mouseY > rSN_ && mouseY < rSS_) {

    return true;
  } else {
    return false;
  }
}
