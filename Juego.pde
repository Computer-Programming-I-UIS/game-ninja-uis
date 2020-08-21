class Juego{
  Menu menu;
  int numeroDeNiveles = 3;
  int estado;
  PFont fuente;
  Nivel niveles[];
  int puntos, vidas, nivel;
  JSONObject configuraciones[];
  PImage texturaPasto, texturaJugador, texturaObstaculo;
  PImage[] texturasBombas;
  Personaje jugador;
  
  Juego(){
    puntos = 0;
    vidas = 3;
    nivel = 0;
    estado = 0;
    texturasBombas = new PImage[4];
    for (int i = 0; i < texturasBombas.length; i++){
      texturasBombas[i] = loadImage(String.format("texturas/bomba%d.png",i));
    }
    jugador = new Personaje(this, texturasBombas);
    configuraciones = new JSONObject[numeroDeNiveles];
    for (int i = 0; i < numeroDeNiveles; i++){
      configuraciones[i] = loadJSONObject(String.format("conf/nivel%d.json", i+1));
    }
    fuente = createFont("fuente/HUM521B.TTF",72);
    PImage fondo = loadImage("texturas/menu.png");
    texturaPasto = loadImage("texturas/pasto.png");
    texturaJugador = loadImage("texturas/ninja.png");
    texturaObstaculo = loadImage("texturas/ladrillo.png");
    menu = new Menu(fondo, this);
    niveles = new Nivel[numeroDeNiveles];
    for (int i = 0; i < numeroDeNiveles; i++){
      niveles[i] = new Nivel(this, configuraciones[i], texturaPasto, texturaJugador, texturaObstaculo);
    }
  }
  
  int getPuntos(){
    return puntos;
  }
  
  int getVidas(){
    return vidas;
  }
  
  int getNivel(){
    return estado;
  }
  
  void updateJugador(int x, int y){
    niveles[estado-1].updateJugador(x, y);
  }
  
  void setJugador(int x_, int y_){
    jugador.setXY(x_, y_);
  }
  
  boolean getIfIsObstaculo(int x, int y){
    return niveles[estado-1].getIfIsObstaculo(x,y);
  }
  
  void display(){
    textFont(fuente,48);
    background(0);
    if (estado == 0){
      menu.dibujar();
    } else {
      niveles[estado-1].dibujar();
    }
    if (jugador.getIfBombs()){
      jugador.dibujarBombas();
    }
  }
  
  void subirEstado(){
    estado += 1;
  }
  
  void keyPressed(){
    jugador.keyPressed();
  }
  
  void click(){
    if (estado == 0){
      menu.click();
    } else {
      niveles[estado-1].click();
    }
  }
}
