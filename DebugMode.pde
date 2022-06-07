class DebugMode {

  DebugMode(){
  }

void update(){
}
void display(){
mostraAreaJogo();
mostraMouseFPS();
desenhaPaletaCores();
}

void desenhaPaletaCores() {
    float ac = 30;
    int lc = width/cores.length; 
    lc = width/cores.length;
    textAlign(CENTER, CENTER);
    textSize(12);
    noStroke();
    for (int i=0; i<cores.length; i++) {
      fill(cores[i]);
      rect(lc*i, height-ac, lc, ac);
      fill(0);
      text(""+i, lc*i, height-ac, lc, ac);
    }
  }

void mostraMouseFPS() {
    textSize(12);
    textAlign(RIGHT, TOP);
    fill(255);
    text("Mouse X: "+mouseX+"\nMouse Y: "+mouseY+"\nFPS: "+frameRate, 10, 10, width-20, height-20);
  }

void mostraAreaJogo() {
    noFill();
    strokeWeight(5);
    stroke(cores[6]);
    rect(me, mc, width-me-md, height-mc-mb);

    strokeWeight(1);
    stroke(cores[2]);
    for (int i=0; i<=colunas; i++) {
      line(me+i*espacoX, mc, me+i*espacoX, height-mb);
    }

    for (int i=0; i<=linhas; i++) {
      line(me, mc+i*espacoY, width-md, mc+i*espacoY);
    }

    strokeWeight(5);
    stroke(cores[4]);
    for (int i=0; i<itens; i++) {
      point(me+espacoX/2+i%colunas*espacoX, mc+espacoY/2+floor(i/colunas)*espacoY);
    }
  }
  
  float[][] obterGrid() {

    gridPontos = new float[itens][2];

    for (int i = 0; i<itens; i++) {
      float px = me+espacoX/2+i%colunas*espacoX;
      float py = mc+espacoY/2+floor(i/colunas)*espacoY;

      gridPontos[i][0] = px;
      gridPontos[i][1] = py;
    }
    return gridPontos;
  }

}
