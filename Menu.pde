class Menu{
  PImage fondo;
  Juego juego;
  Menu(PImage fondo_, Juego juego_){
    fondo = fondo_;
    juego = juego_;
  }
  
  void dibujar(){
    image(fondo,0,0);
  }
  
  void click(){
    if (mouseX > 560 && mouseX < 720 && mouseY > 339 && mouseY < 405){
      println("Se ha presionado el boton de jugar");
      juego.subirEstado();
    } else if (mouseX > 553 && mouseX < 729 && mouseY > 427 && mouseY < 491){
      exit();
    }
  }
}
