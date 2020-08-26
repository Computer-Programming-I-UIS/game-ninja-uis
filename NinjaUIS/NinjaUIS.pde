import ddf.minim.*;
import processing.sound.*;

Minim soundEngine;
Juego juego;
PImage texturaPasto, texturaJugador, texturaObstaculo, fondoMenu;
PImage[] texturasBombas, virus;
PFont fuente;
SoundFile sonidoMenu, sonidoBomba, sonidoPaso, sonidoHit, sonidoSubirNivel, sonidoPierde;

void setup(){
  texturaPasto = loadImage("resources/pasto.png");
  texturaJugador = loadImage("resources/ninja.png");
  texturaObstaculo = loadImage("resources/ladrillo.png");
  fondoMenu = loadImage("resources/menu.png");
  texturasBombas = new PImage[11];
  for (int i = 0; i < texturasBombas.length; i++){
    texturasBombas[i] = loadImage(String.format("resources/bomba%d.png",i));
  }
  virus = new PImage[8];
  for (int i = 0; i < virus.length; i++){
    virus[i] = loadImage(String.format("resources/virus%d.png",i));
  }
  sonidoMenu = new SoundFile(this, "resources/start.mp3");
  sonidoBomba = new SoundFile(this, "resources/boom.mp3");
  sonidoPaso = new SoundFile(this, "resources/step.mp3");
  sonidoHit = new SoundFile(this, "resources/hit.mp3");
  sonidoSubirNivel = new SoundFile(this, "resources/subir.mp3");
  sonidoPierde = new SoundFile(this, "resources/pierde.mp3");
  sonidoBomba.amp(0.1);
  sonidoHit.amp(0.3);
  soundEngine = new Minim(this);
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
