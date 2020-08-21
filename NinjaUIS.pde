import ddf.minim.*;
import processing.sound.*;

Minim soundEngine;
Juego juego;
PImage texturaPasto, texturaJugador, texturaObstaculo, fondoMenu;
PImage[] texturasBombas;
PFont fuente;
SoundFile sonidoMenu, sonidoBomba, sonidoPaso, sonidoHit;

void setup(){
  size(1280,720);
  texturaPasto = loadImage("resources/pasto.png");
  texturaJugador = loadImage("resources/ninja.png");
  texturaObstaculo = loadImage("resources/ladrillo.png");
  fondoMenu = loadImage("resources/menu.png");
  texturasBombas = new PImage[11];
  for (int i = 0; i < texturasBombas.length; i++){
    texturasBombas[i] = loadImage(String.format("resources/bomba%d.png",i));
  }
  sonidoMenu = new SoundFile(this, "resources/start.mp3");
  sonidoBomba = new SoundFile(this, "resources/boom.mp3");
  sonidoPaso = new SoundFile(this, "resources/step.mp3");
  sonidoHit = new SoundFile(this, "resources/hit.mp3");
  sonidoBomba.amp(0.1);
  sonidoHit.amp(0.3);
  soundEngine = new Minim(this);
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
