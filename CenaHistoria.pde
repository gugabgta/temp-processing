class CenaHistoria extends Scene {
  PImage img_menu;
  float fl;
  float fa;
  MessageBox m;

  CenaHistoria() {
    super();
  }

  @Override void update() {
  }

  @Override void display() {
    fill(#000000);
    background(#000000);
    fill(50);
    noStroke();
    fill(30);
    rect( 0, 0, width, height);
    textAlign(CENTER, TOP);
    textFont(minhaFonte);
    textSize(30);
    fill(#d00b1c);
    text("Essa e a historia de Felpudo ", 0, 60, width, 160);
    text("Um grande guerreiro ", 0, 100, width, 160);
    text("\nque protege a Fofura", 0, 140, width, 160);
    text("\numa nobre donzela dos campos de ferro", 0, 180, width, 160);
    text("\nporem, incontaveis montros apareceram ", 0, 220, width, 160);
    text("\nameacando a paz da Fofura e de nosso heroi", 0, 260, width, 160);
    text("\nagora, Felpudo deve proteger a paz", 0, 300, width, 160);

    text("\naperte X para comecar sua jornada", 0, 380, width, 160);
    pushMatrix();
    popMatrix();

  }

  //mouse pressed
  void apertouKey(Scene proxima) {
    if (!this.ativo) {
      return;
    }
    if (key == 'X' || key == 'x') {
      proxima.ativo=true;
      this.ativo=false;
    }
  }
}
