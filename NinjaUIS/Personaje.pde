class Personaje {
  int x, y;
  ArrayList<Bomba> bombas;
  Juego juego;
  int delayBomba;
  double lastBombTime;

  Personaje(Juego juego_) {
    juego = juego_;
    bombas = new ArrayList();
    delayBomba = 1000;
    lastBombTime = millis();
  }

  boolean getIfBombs() {
    return !bombas.isEmpty();
  }

  void dibujarBombas() {
    ArrayList<Bomba> eliminar = new ArrayList<Bomba>();
    for (Bomba b : bombas) {
      if (b.getExiste()) {
        b.dibujar();
      } else {
        eliminar.add(b);
      }
    }
    bombas.removeAll(eliminar);
  }

  void setXY(int x_, int y_) {
    x = x_;
    y = y_;
  }

  void keyPressed() {
    if (juego.getNivel() > 0) {
      if (key == CODED && juego.getNivel() > 0) {
        if (keyCode == UP && y > 0 && !juego.getIfIsObstaculo(x, y-1)) {
          y -= 1;
          sonidoPaso.play();
        } else if (keyCode == DOWN && y < 5 && !juego.getIfIsObstaculo(x, y+1)) {
          y += 1;
          sonidoPaso.play();
        } else if (keyCode == LEFT && x > 0 && !juego.getIfIsObstaculo(x-1, y)) {
          x -= 1;
          sonidoPaso.play();
        } else if (keyCode == RIGHT && x < 11 && !juego.getIfIsObstaculo(x+1, y)) {
          x += 1;
          sonidoPaso.play();
        }
        if (juego.getNivelObj().enemigoEnCasilla(x, y)) {
          juego.quitarVida();
        }
      }
      if (key == ' ') {
        if (bombas.size() < 5 && (millis()-lastBombTime) > delayBomba) {
          lastBombTime = millis();
          bombas.add(new Bomba(x, y, juego.getNivel()));
        }
      } 
      juego.updateJugador(x, y);
    }
  }
}
