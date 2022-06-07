class Actor {

  float x;
  float y;
  float l;
  float a;
  float scaleX;
  float scaleY;

  int direcaoX;
  int direcaoY;
  float velocidade;
  float raio;
  PImage img;
  String imageUrl;

  float contador;
  int frame = 1;
  ArrayList<PImage> imagens;

  float duracaoAnima = 1f;
  int frames = 6;
  float duracaoCadaFrame = duracaoAnima/frames;
  int tag = 0; // 1- moeda 2 - pena 3 - inimogo.

  Actor(String imageUrl, float x, float y, float scaleX, float scaleY, float raio, float duracaoAnima, int frames ) {
    this.x = x;
    this.y = y;
    this.scaleX = scaleX;
    this.scaleY = scaleY;
    this.raio = raio;
    this.imageUrl = imageUrl;
    this.duracaoAnima = duracaoAnima;
    this.frames = frames;

    imagens = new ArrayList<PImage>();
    this.imageUrl = imageUrl;

    for (int i =1; i<=frames; i++) {
      PImage img;
      img = loadImage (""+imageUrl+"/"+imageUrl+i+".png");
      imagens.add(img);
    }
    PImage img = loadImage (""+imageUrl+"/"+imageUrl+"1.png");
    this.l = img.width;
    this.a = img.height;
  }

  void update() {
    if (!acabou) {
      x += velocidade*direcaoX;
      y += velocidade*direcaoY;

      if (y>height-a*scaleY/2-mb) {
        direcaoY = -1;
      } else if (y<a*scaleY/2+mc) {
        direcaoY = 1;
      }

      if (x>width-l*scaleX/2-md) {
        direcaoX = -1;
      } else if (x<l*scaleX/2+me) {
        direcaoX = 1;
      }
    }
  }

  void display() {

    contador += 0.1f*deltaTime;

    if (contador>duracaoCadaFrame) {
      if (frame<frames) {
        frame++;
      } else {
        frame=1;
      }
      contador = 0.0f;
    }
    image(imagens.get(frame%frames), x-l*scaleX/2, y-a*scaleY/2, l, a);



    if (debugMode) {
      stroke(255, 255, 0);
      strokeWeight(1);
      noFill();
      rect(x-l*scaleX/2, y-a*scaleY/2, l*scaleX, a*scaleY);
      strokeWeight(3);
      point(x, y);
      strokeWeight(1);
      ellipse(x, y, raio*2, raio*2);
    }
  }
}
