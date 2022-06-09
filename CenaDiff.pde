class CenaDiff extends Scene {
  PImage img_menu;
  float fl;
  float fa;

  CenaDiff() {
    super();

    img_menu = loadImage("diff.png");
    fl = img_menu.width*0.9;
    fa = img_menu.height*0.9;
  }

  @Override void update() {
  }

  @Override void display() {
    fill(#ab9758);
    background(#ab9758);
    fill(50);
    noStroke();
    fill(30);
    rect( 0, 40, width, 80);
    textAlign(CENTER, TOP);
    textFont(minhaFonte);
    textSize(52);
    fill(#d00b1c);
    text("Escolha a Dificuldade", 0, 60, width, 160);
    pushMatrix();
    scale(-1, 1.0);
    image(img_menu, -width/2-fl/2, height-fa-20, fl, fa);
    popMatrix();
  }

  //mouse pressed
  void mousePressed(Scene easy, Scene hard) {
    if (!this.ativo) {
      return;
    }
    start.rewind();
    start.play();
    if (mouseX > 230 && mouseX < 450 && mouseY > 270 && mouseY < 360) {
        hard.ativo=true;
        this.ativo=false;
    } else if (mouseX > 230 && mouseX < 450 && mouseY > 370 && mouseY < 460) {
        easy.ativo=true;
        this.ativo=false;
    }
  }
}
