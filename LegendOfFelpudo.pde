import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

float deltaTime;
boolean debugMode = false;
color [] cores = {#BF3B0F, #F5A716, #E5DE07, #ABF214, #109EE3, #C102ED, #ED0278, #AAAA00, #0000AA};
float [][] gridPontos;
PFont minhaFonte;
String mensagemFimDeJogo;

boolean comecou;
boolean acabou;

int tempo;
int pontos;
int vidas=8;
int moedas;
int peninhas;

int itens = 25;
int colunas = 5;
int linhas = itens/colunas;
float espacoX;
float espacoY;

boolean invencivel = false;
DebugMode meuDebug;

CenaIntro cenaIntro;
CenaGame cenaGame;
CenaMenu cenaMenu;
CenaDiff cenaDiff;
CenaGame2 cenaGame2;
CenaGame3 cenaGame3;
CenaGame4 cenaGame4;
CenaGame5 cenaGame5;
CenaGame6 cenaGame6;
CenaHistoria cenaHistoria;

Minim gerenciador;
AudioPlayer musica_de_fundo;
AudioPlayer start;
AudioPlayer coin;
AudioPlayer tiro;
AudioPlayer hit;

ArrayList<Scene> cenas;

float me = 35;
float md = 35;
float mc = 110;
float mb = 45;

void settings() {
  size(720, 486);
}

int contaFase = 0;

void setup() {
  frameRate(60);
  meuDebug = new DebugMode();

  cenas = new ArrayList<Scene>();
  cenaIntro = new CenaIntro();
  cenaMenu = new CenaMenu();
  cenaDiff = new CenaDiff();
  cenaGame = new CenaGame();
  cenaGame2 = new CenaGame2();
  cenaGame3 = new CenaGame3();
  cenaGame4 = new CenaGame4();
  cenaGame5 = new CenaGame5();
  cenaGame6 = new CenaGame6();
  cenaHistoria = new CenaHistoria();

  cenaGame.defineProximaFase(cenaGame2);
  cenaGame2.defineProximaFase(cenaGame3);
  cenaGame4.defineProximaFase(cenaGame5);
  cenaGame5.defineProximaFase(cenaGame6);
  //cenaGame.defineProximaFase(cenaGame2);
  cenaIntro.ativo=true;
  //cenaDiff.ativo = true;
  //cenaGame.ativo = true;
  cenas.add(cenaGame);
  cenas.add(cenaGame2);
  cenas.add(cenaGame3);
  cenas.add(cenaGame4);
  cenas.add(cenaGame5);
  cenas.add(cenaGame6);
  cenas.add(cenaIntro);
  cenas.add(cenaMenu);
  cenas.add(cenaDiff);
  cenas.add(cenaHistoria);

  gerenciador = new Minim(this);
  musica_de_fundo = gerenciador.loadFile("indestructible.mp3");
  start = gerenciador.loadFile("start.wav");
  coin = gerenciador.loadFile("coin.wav");
  tiro = gerenciador.loadFile("gun.mp3");
  hit = gerenciador.loadFile("hit.wav");

  musica_de_fundo.rewind();
  musica_de_fundo.play();
}
void draw() {
  clear();
  deltaTime = 30/frameRate;


  if (debugMode) {
    meuDebug.display();
  }

  for (Scene c : cenas) {
    if (c.ativo) {
      c.update();
      c.display();
    }
  }
}

void mousePressed() {
  cenaDiff.mousePressed(cenaGame, cenaGame4);
  cenaMenu.mousePressed(cenaHistoria, cenaIntro);
}

void keyPressed() {
  if (acabou) {
    return;
  }

  if (keyCode==32) {
    if (peninhas>0) {
      peninhas--;
      jogador.atirou();
    }
  }

  if ((keyCode==49) || (key=='1')) {
    debugMode = !debugMode;
  }

  cenaHistoria.apertouKey(cenaDiff);
  cenaIntro.apertouKey(cenaMenu);
  jogador.apertouKey();
}


void keyReleased() {
  jogador.soltouKey();
}

void gameOver(String msg) {
  mensagemFimDeJogo = msg;
  acabou=true;
  //cenaGame.ativo = false;
  //cenaIntro.ativo = true;
}
