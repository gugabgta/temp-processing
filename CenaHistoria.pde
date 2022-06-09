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
    textSize(52);
    fill(#d00b1c);
    text("aqui começa a historia...", 0, 60, width, 160);
    text("pula linha?...", 0, 60, width, 160);
    text("\npossivel tamanho diferente", 0, 90, width, 160);
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
