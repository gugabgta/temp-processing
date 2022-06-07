class Scene {

  boolean ativo;

  Scene() {
  }

  void update() {
  }
  void display() {
  }

  void mensagemFimDeJogo() {
    textFont(minhaFonte);
    textSize(50);
    textAlign(CENTER, CENTER);
    text(mensagemFimDeJogo, 0, 0, width, height);
  }
}
