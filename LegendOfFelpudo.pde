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
Menu menu;

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
  menu = new Menu();
  cenaGame = new CenaGame();

  cenaIntro.ativo=true;

  cenas.add(cenaIntro);
  cenas.add(menu);
  cenas.add(cenaGame);
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
  contaFase++;
  if (contaFase>cenas.size()-1) {
    contaFase=0;
  }

  for (int i=0; i<cenas.size(); i++) {
    Scene c = cenas.get(i);
    c.ativo=false;
    if (i==contaFase) {
      c.ativo=true;
    }
  }
}

void keyPressed() {
  if (!acabou) {
    if (keyCode==32) {

      if (peninhas>0) {
        peninhas--;
        jogador.atirou();
      }
    }


    if ((keyCode==49) || (key=='1')) {
      debugMode = !debugMode;
    }
    jogador.apertouKey();
  }
}

void keyReleased() {
    jogador.soltouKey();
  }
