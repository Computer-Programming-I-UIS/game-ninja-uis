class Personaje{
  int x, y;
  ArrayList<Bomba> bombas;
  PImage texturasBombas[];
  Juego juego;
  int delayBomba;
  double lastBombTime;
  
  Personaje(Juego juego_, PImage texturasBombas_[]){
    juego = juego_;
    bombas = new ArrayList();
    texturasBombas = texturasBombas_;
    delayBomba = 1000;
    lastBombTime = millis();
  }
  
  boolean getIfBombs(){
    return !bombas.isEmpty();
  }
  
  void dibujarBombas(){
    ArrayList<Bomba> eliminar = new ArrayList<Bomba>();
    for(Bomba b : bombas){
      if (b.getExiste()){
        b.dibujar();
      } else {
        eliminar.add(b);
      }
    }
    bombas.removeAll(eliminar);
  }
  
  void setXY(int x_, int y_){
    x = x_;
    y = y_;
  }
  
  void keyPressed(){
    if (key == CODED){
      if (keyCode == UP && y > 0 && !juego.getIfIsObstaculo(x,y-1)){
        y -= 1;
      } else if (keyCode == DOWN && y < 5 && !juego.getIfIsObstaculo(x,y+1)){
        y += 1;
      } else if (keyCode == LEFT && x > 0 && !juego.getIfIsObstaculo(x-1,y)){
        x -= 1;
      } else if (keyCode == RIGHT && x < 11 && !juego.getIfIsObstaculo(x+1,y)){
        x += 1;
      }
    }
    if (key == ' '){
      //println("Poner una bomba");
      println((millis()-lastBombTime) > delayBomba*bombas.size(), millis()-lastBombTime, delayBomba*bombas.size());
      if(bombas.size() < 5 && (millis()-lastBombTime) > delayBomba){
        lastBombTime = millis();
        bombas.add(new Bomba(x,y,1,texturasBombas));
      }
    } 
    juego.updateJugador(x,y);
  }
}
