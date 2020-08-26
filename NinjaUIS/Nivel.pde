class Nivel{
  BarraDeEstado estado;
  Juego juego;
  Casilla casillas[][];
  PImage texturaPasto, texturaJugador, texturaObstaculo;
  JSONObject configuracion;
  JSONArray posicionJugador, enemigosArray, obstaculos;
  ArrayList<Enemigo> enemigos;
  int dificultad, maximoPuntaje;
  
  Nivel(Juego juego_, JSONObject configuracion_, PImage texturaPasto_, PImage texturaJugador_, PImage texturaObstaculo_, int dificultad_){
    juego = juego_;
    estado = new BarraDeEstado(juego);
    casillas = new Casilla[12][6];
    texturaPasto = texturaPasto_;
    texturaJugador = texturaJugador_;
    texturaObstaculo = texturaObstaculo_;
    texturaJugador.resize(100,100);
    configuracion = configuracion_;
    posicionJugador = configuracion.getJSONArray("jugador");
    enemigosArray = configuracion.getJSONArray("enemigos");
    obstaculos = configuracion.getJSONArray("obstaculos");
    maximoPuntaje = configuracion.getInt("maximoPuntaje");
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
    dificultad = dificultad_;
    enemigos = new ArrayList<Enemigo>();
    crearEnemigos();
  }
  
  void crearEnemigos(){
    JSONArray enemigo;
    for (int i = 0; i < enemigosArray.size(); i++){
      enemigo = enemigosArray.getJSONArray(i);
      enemigos.add(new Enemigo(enemigo.getInt(0), enemigo.getInt(1), dificultad));
    }
  }
  
  void destruirCasilla(int x, int y){
    if (x < casillas.length && x > -1 && y < casillas[0].length && y > -1){
      casillas[x][y].setObstaculo(false);
    }
  }
  
  boolean puedeIr(int x, int y){
    if(x < casillas.length && x > -1 && y < casillas[0].length && y > -1 && !getIfIsObstaculo(x,y) && !casillas[x][y].getEnemigo()){
      return true;
    }
    return false;
  }
  
  void matarEnemigo(int x, int y){
    if (x < casillas.length && x > -1 && y < casillas[0].length && y > -1){
      casillas[x][y].matarEnemigo();
    }
  }
  
  ArrayList<String> getCasillasDisponibles(){
    ArrayList<String> casillasVacias = new ArrayList<String>();
    for (int i = 0; i < casillas.length; i++){
      for (int j = 0; j < casillas[i].length; j++){
        if (!casillas[i][j].getEnemigo() && !getIfIsObstaculo(i,j) && !jugadorEnCasilla(i,j))
        casillasVacias.add(""+i+j);
      }
    }
    return casillasVacias;
  }
  
  void setEnemigo(int x, int y, boolean enemigo_, Enemigo e){
    casillas[x][y].setEnemigo(enemigo_, e);
  }
  
  boolean jugadorEnCasilla(int x, int y){
    return casillas[x][y].jugadorEnCasilla();
  }
  
  boolean getIfIsObstaculo(int x, int y){
    return casillas[x][y].getIsObstaculo();
  }
  
  boolean enemigoEnCasilla(int x, int y){
    return casillas[x][y].getEnemigo();
  }
  
  boolean casillaPuedeExplotar(int x, int y){
    if (x < casillas.length && x > -1 && y < casillas[0].length && y > -1){
      return casillas[x][y].puedeExplotar();
    }
    return false;
  }
  
  void updateJugador(int x, int y){
    casillas[posicionJugador.getInt(0)][posicionJugador.getInt(1)].setJugador(false);
    posicionJugador.setInt(0, x);
    posicionJugador.setInt(1, y);
    casillas[posicionJugador.getInt(0)][posicionJugador.getInt(1)].setJugador(true);
  }
  
  void dibujar(){
    if (juego.getPuntos() >= maximoPuntaje){
      juego.subirEstado();
    }
    estado.dibujar();
    for(int i = 0; i < casillas.length; i++){
      for(int j = 0; j < casillas[i].length; j++){
        casillas[i][j].dibujar();
      }
    }
    dibujarEnemigos();
  }
  
  void dibujarEnemigos(){
    ArrayList<Enemigo> eliminar = new ArrayList<Enemigo>();
    int agregar = 0;
    for(Enemigo e : enemigos){
      if (e.getExiste()){
        e.dibujar();
      } else {
        agregar += 1;
        eliminar.add(e);
      }
    }
    enemigos.removeAll(eliminar);
    for (int i = 0; i < agregar; i++){
      ArrayList<String> casillasVacias = getCasillasDisponibles();
      String casilla = casillasVacias.get((int)(random(casillasVacias.size())));
      int x = Integer.parseInt(casilla.substring(0,1));
      int y = Integer.parseInt(casilla.substring(1,2));
      enemigos.add(new Enemigo(x,y,dificultad));
    }
  }
  void click(){
    
  }
}
