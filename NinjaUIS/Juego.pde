class Juego {
  Menu menu;
  int numeroDeNiveles = 3;
  int estado;

  Nivel niveles[];
  int puntos, vidas, nivel;
  JSONObject configuraciones[];
  Personaje jugador;

  Juego() {
    __init__();
  }

  void __init__() {
    puntos = 0;
    vidas = 3;
    nivel = 0;
    estado = 0;
    jugador = new Personaje(this);
    sonidoMenu.play();
    configuraciones = new JSONObject[numeroDeNiveles];
    for (int i = 0; i < numeroDeNiveles; i++) {
      configuraciones[i] = loadJSONObject(String.format("conf/nivel%d.json", i+1));
    }
    fuente = createFont("fuente/HUM521B.TTF", 72);    
    menu = new Menu();
    niveles = new Nivel[numeroDeNiveles];
    for (int i = 0; i < numeroDeNiveles; i++) {
      niveles[i] = new Nivel(this, configuraciones[i], texturaPasto, texturaJugador, texturaObstaculo, 500/(i+1)+500);
    }
  }

  void subirPuntos(int cantidad) {
    puntos += cantidad;
  }

  void destruirCasilla(int x, int y) {
    niveles[estado-1].destruirCasilla(x, y);
  }

  Nivel getNivelObj() {
    return niveles[estado-1];
  }

  boolean puedeIr(int x, int y) {
    return niveles[estado-1].puedeIr(x, y);
  }

  boolean jugadorEnCasilla(int x, int y) {
    return niveles[estado-1].jugadorEnCasilla(x, y);
  }  

  void quitarVida() {
    sonidoHit.play();
    vidas -= 1;
  }

  int getPuntos() {
    return puntos;
  }

  int getVidas() {
    return vidas;
  }

  int getNivel() {
    return estado;
  }

  void updateJugador(int x, int y) {
    niveles[estado-1].updateJugador(x, y);
  }

  void setJugador(int x_, int y_) {
    jugador.setXY(x_, y_);
  }

  boolean getIfIsObstaculo(int x, int y) {
    return niveles[estado-1].getIfIsObstaculo(x, y);
  }

  void display() {
    textFont(fuente, 48);
    background(0);
    if (estado == 0) {
      menu.dibujar();
    } else if (estado-1 < niveles.length && vidas > 0) {
      niveles[estado-1].dibujar();
    } else {
      sonidoPierde.play();
      __init__();
    }
    if (jugador.getIfBombs()) {
      jugador.dibujarBombas();
    }
  }

  boolean casillaPuedeExplotar(int x, int y) {
    return niveles[estado-1].casillaPuedeExplotar(x, y);
  }

  void subirEstado() {
    estado += 1;
    sonidoSubirNivel.play();
  }

  void keyPressed() {
    jugador.keyPressed();
  }

  void click() {
    if (estado == 0) {
      menu.click();
    } else if (estado-1<niveles.length) {
      niveles[estado-1].click();
    } else {
      
    }
  }
}
