class Shot {

  float dx;
  float dy;
  float velocidade = 7;

  float x;
  float y;
  float l;
  float a;
  float scaleX;
  float scaleY;
  float raio;

  String urlImagem;
  PImage img;

  Shot(float x, float y, float scaleX, float scaleY, String urlImagem, float dx, float dy, float raio) {
    this.raio=raio;
    this.dx=dx;
    this.dy=dy;

    this.x = x;
    this.y = y;
    this.scaleX = scaleX;
    this.scaleY = scaleY;
    this.urlImagem = urlImagem;

    img = loadImage(urlImagem);
    l = img.width*scaleX;
    a = img.height*scaleY;
  }

  void update() {
    x += dx*velocidade;
    y += dy*velocidade;
  }
  void display() {

    pushMatrix(); 
    translate(x, y);
    if (dx<0) {
      scale(-1.0, 1.0);
    } else if (dx>0) {
      scale(1.0, 1.0);
    } else if (dy<0) {
      rotate(-HALF_PI);
    } else {
      rotate(HALF_PI);
    }

    image(img, 0-l/2, 0-a/2, l, a);

    popMatrix();


    if (debugMode) {

      stroke(255, 255, 0);
      strokeWeight(5);
      point(x, y);
      strokeWeight(1);
      noFill();
      ellipse( x, y, raio*2, raio*2);
    }
  }
}
