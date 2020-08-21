class Bomba{
  int x, y, magnitud;
  double startedAt;
  boolean existe, explota;
  int delay, delayExplosion;
  
  Bomba(int x_, int y_, int magnitud_){
    startedAt = millis();
    x = x_;
    y = y_;
    magnitud = magnitud_;
    existe = true;
    delay = 300;
    explota = false;    
  }
  
  boolean getExiste(){
    return existe;
  }
  
  void dibujar(){
    println((int)(millis()-startedAt)/delay);
    if (millis()-startedAt < 4*delay){
      image(texturasBombas[(int)(millis()-startedAt)/delay],100*x+40, 100*y+120);
    } else if (!(millis()-startedAt < 4*delay) && !explota) {
      explota = true;
      sonidoBomba.play();
      for (int i = -magnitud; i <= magnitud; i++){
        if (juego.casillaPuedeExplotar(x+i,y)){
          if(juego.jugadorEnCasilla(x+i,y))
          juego.quitarVida();
          sonidoHit.play();
        } else if (juego.casillaPuedeExplotar(x,y+i)) {
          if(juego.jugadorEnCasilla(x,y+i))
          juego.quitarVida();
          sonidoHit.play();
        }
      }
    }
    if (explota && millis()-startedAt < 11*delay){
      int casillaX, casillaY;
      for (int i = 0; i <= magnitud; i++){
        casillaX = x+i;
        casillaY = y;
        if (juego.casillaPuedeExplotar(casillaX,casillaY)){
          image(texturasBombas[(int)(millis()-startedAt)/delay],100*(casillaX)+40, 100*casillaY+120);
        } else {
          break;
        }
      }
      for (int i = 1; i <= magnitud; i++){
        casillaX = x-i;
        casillaY = y;
        if (juego.casillaPuedeExplotar(casillaX,casillaY)){
          image(texturasBombas[(int)(millis()-startedAt)/delay],100*(casillaX)+40, 100*casillaY+120);
        } else {
          break;
        }
      }
      for (int i = 1; i <= magnitud; i++){
        casillaX = x;
        casillaY = y+i;
        if (juego.casillaPuedeExplotar(casillaX,casillaY)){
          image(texturasBombas[(int)(millis()-startedAt)/delay],100*(casillaX)+40, 100*casillaY+120);
        } else {
          break;
        }
      }
      for (int i = 1; i <= magnitud; i++){
        casillaX = x;
        casillaY = y-i;
        if (juego.casillaPuedeExplotar(casillaX,casillaY)){
          image(texturasBombas[(int)(millis()-startedAt)/delay],100*(casillaX)+40, 100*casillaY+120);
        } else {
          break;
        }
      }
    } else if (explota) {
      existe = false;
    }
  }  
}
