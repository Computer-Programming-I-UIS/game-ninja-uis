class Casilla{
  PImage texturaPasto, texturaJugador;
  int x, y;
  boolean jugador;
  Casilla(PImage texturaPasto_,PImage texturaJugador_, int x_, int y_){
    texturaPasto = texturaPasto_;
    x = x_;
    y = y_;
    texturaJugador = texturaJugador_;
    jugador = false;
  }
  
  void setJugador(boolean jugador_){
    jugador = jugador_;
  }
  
  void dibujar(){
    //image(texturaPasto, x, y);
    fill(53,104,45);
    noStroke();
    rect(x,y,100,100);
    if (jugador){
      image(texturaJugador, x, y);
    }

  }
}
