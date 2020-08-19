class Juego{
  Menu menu;
  int numeroDeNiveles = 3;
  int estado;
  PFont fuente;
  Nivel niveles[];
  int puntos, vidas, nivel;
  JSONObject configuraciones[];
  
  Juego(){
    puntos = 0;
    vidas = 3;
    nivel = 0;
    estado = 0;
    configuraciones = new JSONObject[numeroDeNiveles];
    for (int i = 0; i < numeroDeNiveles; i++){
      configuraciones[i] = loadJSONObject(String.format("conf/nivel%d.json", i+1));
    }
    fuente = createFont("fuente/HUM521B.TTF",72);
    PImage fondo = loadImage("texturas/menu.png");
    menu = new Menu(fondo, this);
    niveles = new Nivel[numeroDeNiveles];
    for (int i = 0; i < numeroDeNiveles; i++){
      niveles[i] = new Nivel(this, configuraciones[i]);
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
  
  void display(){
    textFont(fuente,48);
    background(0);
    if (estado == 0){
      menu.dibujar();
    } else {
      niveles[estado-1].dibujar();
    }
  }
  
  void subirEstado(){
    estado += 1;
  }
  
  void keyPressed(){
    if(key == CODED){
      
    }
  }
  
  void click(){
    if (estado == 0){
      menu.click();
    } else {
      niveles[estado-1].click();
    }
  }
}
