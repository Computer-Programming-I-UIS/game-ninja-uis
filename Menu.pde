class Menu{
  boolean creditosBool;
  String creditos;
  int y, numeroDeLineas;
  
  Menu(){
    creditosBool = false;
    y = height;
    String[] file = loadStrings("resources/credits.txt");
    creditos = "";
    numeroDeLineas = 0;
    for (String s: file){
      creditos += s+"\n";
      numeroDeLineas += 1;
    }
    //sonidoMenu.loop();
  }
  
  void dibujar(){
    if (!creditosBool){
      image(fondoMenu,0,0);
    } else {
      dibujarCreditos();
    }
  }
  
  void dibujarCreditos(){
    y=y-1;
    background(0);
    textAlign(CENTER);
    text(creditos, width/2, y);
    if (y+textAscent()*numeroDeLineas+720 < 0){
      y = height;
      creditosBool = false;
    }
  }
  
  void click(){
    if (mouseX > 560 && mouseX < 720 && mouseY > 309 && mouseY < 369){
      println("Se ha presionado el boton de jugar");
      juego.subirEstado();
      //sonidoMenu.stop();
    } else if (mouseX > 527 && mouseX < 759 && mouseY > 376 && mouseY < 450){
      creditosBool = true;
    } else if (mouseX > 553 && mouseX < 732 && mouseY > 460 && mouseY < 528){
      exit();
    }
  }
}
