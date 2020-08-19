class BarraDeEstado{
  Juego juego;
  BarraDeEstado(Juego juego_){
    juego = juego_;
  }
  
  void dibujar(){
    fill(47, 47, 47);
    rect(0, 0, width, 120);
    fill(255);
    textAlign(LEFT);
    text(String.format("Puntos: %d", juego.getPuntos()), 100, 77);
    textAlign(CENTER);
    text(String.format("Nivel %d", juego.getNivel()), 644, 77);
    textAlign(RIGHT);
    text(String.format("Vidas: %d", juego.getVidas()), 1083, 77);
  }
}
