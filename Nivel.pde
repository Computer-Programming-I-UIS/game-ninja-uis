class Nivel{
  BarraDeEstado estado;
  Juego juego;
  Casilla casillas[][];
  PImage texturaPasto, texturaJugador;
  JSONObject configuracion;
  
  Nivel(Juego juego_, JSONObject configuracion_){
    juego = juego_;
    estado = new BarraDeEstado(juego);
    casillas = new Casilla[12][6];
    texturaPasto = loadImage("texturas/pasto.png");
    texturaJugador = loadImage("texturas/ninja.png");
    texturaJugador.resize(100,100);
    configuracion = configuracion_;
    JSONArray posicionJugador = configuracion.getJSONArray("jugador");
    //JSONArray enemigos = configuracion.getJSONArray("enemigos");
    for(int i = 0; i < casillas.length; i++){
      for(int j = 0; j < casillas[i].length; j++){
        casillas[i][j] = new Casilla(texturaPasto, texturaJugador, 100*i+40, 100*j+120);
        if (i == posicionJugador.getInt(0) && j == posicionJugador.getInt(1)){
          casillas[i][j].setJugador(true);
        }
      }
    }
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
