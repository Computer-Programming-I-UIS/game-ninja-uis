class Enemigo{
  float delayPaso, delayImagen;
  double startedAt;
  int x, y, dificultad;
  boolean existe;
  
  Enemigo(int x_, int y_, int dificultad_){
    dificultad = dificultad_;
    delayPaso = dificultad*random(2,5);
    delayImagen = 60;
    startedAt = -1;
    x = x_;
    y = y_;
    existe = true;
  }
  
  void matar(){
    juego.subirPuntos(250000/dificultad);
    existe = false;
  }
  
  boolean getExiste(){
    return existe;
  }
  
  void darPaso(){
    float direccion1 = random(0,1);
    float direccion2 = random(0,1);
    if (direccion1 > 0.5){
      if (direccion2 > 0.5){
        if (juego.puedeIr(x+1,y)){
          x += 1;
        }
      } else {
        if (juego.puedeIr(x-1,y)){
          x -= 1; 
        }
      }
    } else {
      if (direccion2 > 0.5){
        if (juego.puedeIr(x,y+1)){
          y += 1; 
        }
      } else {
        if (juego.puedeIr(x,y-1)){
          y -= 1; 
        }
      }
    }
    if (juego.jugadorEnCasilla(x,y)){
      juego.quitarVida();
    }
  }
  
  void dibujar(){
    if (millis()-startedAt > delayPaso){
      juego.getNivelObj().setEnemigo(x,y,false, null);
      darPaso();
      juego.getNivelObj().setEnemigo(x,y,true, this);
      startedAt = millis();
    }
    image(virus[(int)((millis()-startedAt)/delayImagen)%virus.length], 100*x+40, 100*y+120);
     
  }
}
