Juego juego;

void setup(){
  size(1280,720);
  juego = new Juego();
  frameRate(-1);
}

void draw(){
  juego.display();
  fill(255);
  textAlign(LEFT);
  textSize(15);
  text(String.format("%d fps", int(frameRate)),0,15);
}

void mouseClicked(){
  juego.click();
}

void keyPressed(){
  juego.keyPressed();
}
