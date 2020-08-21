class Bomba{
  int x, y, magnitud;
  double startedAt;
  PImage[] texturas;
  boolean existe;
  int delay;
  
  Bomba(int x_, int y_, int magnitud_, PImage[] texturas_){
    startedAt = millis();
    x = x_;
    y = y_;
    magnitud = magnitud_;
    texturas = texturas_;
    existe = true;
    delay = 1000;
  }
  
  boolean getExiste(){
    return existe;
  }
  
  void dibujar(){
    if (millis()-startedAt < 4*delay){
      image(texturas[(int)(millis()-startedAt)/delay],100*x+40, 100*y+120);
    } else {
      existe = false;
    }
  }  
}
