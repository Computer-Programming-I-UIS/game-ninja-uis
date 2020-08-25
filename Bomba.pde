class Bomba{
  int x, y, magnitud;
  double startedAt;
  boolean existe, explota, quitoVida;
  int delay, delayExplosion, index;
  ArrayList<String> rompio;
  
  Bomba(int x_, int y_, int magnitud_){
    startedAt = millis();
    x = x_;
    y = y_;
    magnitud = magnitud_;
    existe = true;
    delay = 500;
    explota = false;   
    quitoVida = false;
    rompio = new ArrayList<String  >();
  }
  
  boolean getExiste(){
    return existe;
  }
  
  boolean dibujarFrame(int casillaX, int casillaY){
    if(casillaX*casillaY > -1){
      if(!rompio.contains(""+casillaX+casillaY) && juego.casillaPuedeExplotar(casillaX,casillaY)){
        if(juego.jugadorEnCasilla(casillaX, casillaY) && !quitoVida){
          juego.quitarVida();
          quitoVida = true;
        }
        image(texturasBombas[index],100*(casillaX)+40, 100*casillaY+120);
      } else {
            if (!rompio.contains(""+casillaX+casillaY)){
              rompio.add(""+casillaX+casillaY);
              juego.destruirCasilla(casillaX, casillaY);
            }
            return false;
      }
    }
    return true;
  }
  
  void dibujar(){
    index = (int)(millis()-startedAt)/delay;
    if (millis()-startedAt < 4*delay && !explota){
      image(texturasBombas[index],100*x+40, 100*y+120);
    } else if (!(millis()-startedAt < 4*delay) && !explota) {
      delay = 60;
      startedAt = millis()-4*delay;
      explota = true;
      sonidoBomba.play();
    }
    if (explota && millis()-startedAt < 11*delay){
      int casillaX, casillaY;
      for (int i = 0; i <= magnitud; i++){
        casillaX = x+i;
        casillaY = y;
        if(!dibujarFrame(casillaX, casillaY)){
          break;
        }
      }
      for (int i = 1; i <= magnitud; i++){
        casillaX = x-i;
        casillaY = y;
        if(!dibujarFrame(casillaX, casillaY)){
          break;
        }
      }
      for (int i = 1; i <= magnitud; i++){
        casillaX = x;
        casillaY = y+i;
        if(!dibujarFrame(casillaX, casillaY)){
          break;
        }
      }
      for (int i = 1; i <= magnitud; i++){
        casillaX = x;
        casillaY = y-i;
        if(!dibujarFrame(casillaX, casillaY)){
          break;
        }
      }
    } else if (explota) {
      existe = false;
    }
  }  
}
