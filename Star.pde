class Star {

  float x;
  float y;
  float escalaX;
  float escalaY;
  float l;
  float a;

  PImage img;

  boolean ativo;
  float conta;

  Star(float x, float y, float escalaX, float escalaY) {
    this.x = x;
    this.y = y;
    this.escalaX = escalaX;
    this.escalaY = escalaY;
    img = loadImage("particle.png");
    this.l = img.width*escalaX;
    this.a = img.height*escalaY;

    ativo = true;
    conta = 0;
  }

  void display() {
    image(img, x-l/2, y-a/2, l, a);
  }
  void update() { 
    conta += 0.05*deltaTime;
    if (conta>0.75) {
      ativo=false; 
    }
  }
}
