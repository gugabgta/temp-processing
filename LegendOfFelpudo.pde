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
  cenaGame = new CenaGame();
  cenaMenu = new CenaMenu();

  cenaIntro.ativo=true;
  //cenaMenu.ativo = true;
  cenas.add(cenaGame);
  cenas.add(cenaIntro);
  cenas.add(cenaMenu);

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
  cenaMenu.mousePressed(cenaGame, cenaIntro);

  contaFase++;
  if (contaFase>cenas.size()-1) {
    contaFase=0;
  }
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

  cenaIntro.apertouKey(cenaMenu);
  jogador.apertouKey();
}


void keyReleased() {
  jogador.soltouKey();
}

void gameOver(String msg) {
  mensagemFimDeJogo = msg;
  cenaGame.ativo = false;
  cenaIntro.ativo = true;
  acabou=true;
}
