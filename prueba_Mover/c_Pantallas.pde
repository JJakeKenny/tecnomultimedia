class Pantalla {

  //propiedades (Variables del objeto)
  
  Pantalla() {
    
   p = 0;
   
  }
 
 
  void cambiaPantalla(){
  
    if(p == 0){
     
      image(nivel, 300,300);
      
    }else if( p == 1){
      
      image(nivel1, 300,300);
    }
}
  }
