class Casilla{
  PImage texturaPasto, texturaJugador, texturaObstaculo;
  int x, y;
  boolean jugador, obstaculo;
  Casilla(PImage texturaPasto_,PImage texturaJugador_,PImage texturaObstaculo_, int x_, int y_){
    texturaPasto = texturaPasto_;
    texturaJugador = texturaJugador_;
    texturaObstaculo = texturaObstaculo_;
    x = x_;
    y = y_;
    jugador = false;
  }
  
  void setJugador(boolean jugador_){
    jugador = jugador_;
  }
  
  void setObstaculo(boolean obstaculo_){
    obstaculo = obstaculo_;
  }
  
  boolean getIsObstaculo(){
    return obstaculo;
  }
  
  boolean puedeExplotar(){
    if(!obstaculo){
      return true;
    }
    return false;
  }
  
  boolean jugadorEnCasilla(){
    return jugador;
  }
  
  void dibujar(){
    //image(texturaPasto, x, y);
    fill(53,104,45);
    noStroke();
    if (obstaculo){
      image(texturaObstaculo, x, y);
    } else {
      rect(x,y,100,100);
    }
    if (jugador){
      image(texturaJugador, x, y);
    }

  }
}
