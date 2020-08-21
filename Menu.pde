class Menu{
  Menu(){
    //sonidoMenu.loop();
  }
  
  void dibujar(){
    image(fondoMenu,0,0);
  }
  
  void click(){
    if (mouseX > 560 && mouseX < 720 && mouseY > 309 && mouseY < 369){
      println("Se ha presionado el boton de jugar");
      juego.subirEstado();
      //sonidoMenu.stop();
    } else if (mouseX > 527 && mouseX < 759 && mouseY > 376 && mouseY < 450){
      
    } else if (mouseX > 553 && mouseX < 732 && mouseY > 460 && mouseY < 528){
      exit();
    }
  }
}
