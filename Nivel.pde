class Nivel{
  BarraDeEstado estado;
  Juego juego;
  Casilla casillas[][];
  PImage texturaPasto, texturaJugador, texturaObstaculo;
  JSONObject configuracion;
  JSONArray posicionJugador, enemigos, obstaculos;
  
  Nivel(Juego juego_, JSONObject configuracion_, PImage texturaPasto_, PImage texturaJugador_, PImage texturaObstaculo_){
    juego = juego_;
    estado = new BarraDeEstado(juego);
    casillas = new Casilla[12][6];
    texturaPasto = texturaPasto_;
    texturaJugador = texturaJugador_;
    texturaObstaculo = texturaObstaculo_;
    texturaJugador.resize(100,100);
    configuracion = configuracion_;
    posicionJugador = configuracion.getJSONArray("jugador");
    enemigos = configuracion.getJSONArray("enemigos");
    obstaculos = configuracion.getJSONArray("obstaculos");
    for(int i = 0; i < casillas.length; i++){
      for(int j = 0; j < casillas[i].length; j++){
        casillas[i][j] = new Casilla(texturaPasto, texturaJugador, texturaObstaculo, 100*i+40, 100*j+120);
      }
    }
    casillas[posicionJugador.getInt(0)][posicionJugador.getInt(1)].setJugador(true);
    juego.setJugador(posicionJugador.getInt(0),posicionJugador.getInt(1));
    JSONArray obstaculo;
    for (int i = 0; i < obstaculos.size(); i++){
      obstaculo = obstaculos.getJSONArray(i);
      casillas[obstaculo.getInt(0)][obstaculo.getInt(1)].setObstaculo(true);
    }
    for (int i = 0; i < enemigos.size(); i++){
      
    }
  }
  
  boolean getIfIsObstaculo(int x, int y){
    return casillas[x][y].getIsObstaculo();
  }
  
  void updateJugador(int x, int y){
    casillas[posicionJugador.getInt(0)][posicionJugador.getInt(1)].setJugador(false);
    posicionJugador.setInt(0, x);
    posicionJugador.setInt(1, y);
    casillas[posicionJugador.getInt(0)][posicionJugador.getInt(1)].setJugador(true);
  }
  
  void dibujar(){
    estado.dibujar();
    for(int i = 0; i < casillas.length; i++){
      for(int j = 0; j < casillas[i].length; j++){
        casillas[i][j].dibujar();
      }
    }
  }
  
  void click(){
    
  }
}
