class Player {

  float x;
  float y;
  float l;
  float a;
  float escalaX;
  float escalaY;
  float raio;

  int direcaoX;
  int direcaoY;

  int lastDX;
  int lastDY=1;

  float velocidade;

  boolean piscaHit;
  float hit = 0.0f;

  ArrayList<PImage> playerIdleDown;
  ArrayList<PImage> playerIdleUp;
  ArrayList<PImage> playerIdleLeft;
  ArrayList<PImage> playerIdleRight;
  ArrayList<PImage> playerWalkDown;
  ArrayList<PImage> playerWalkUp;
  ArrayList<PImage> playerWalkLeft;
  ArrayList<PImage> playerWalkRight;

  ArrayList<ArrayList> spritesPlayer;
  ArrayList<PImage> spriteVez;

  float contadorAnima = 1;
  int indexAnima = 0;

  Player(float x, float y, float escalaX, float escalaY, float raio) {
    this.x = x;
    this.y = y;

    this.escalaX = escalaX;
    this.escalaY = escalaY;

    this.raio=raio;

    playerIdleDown = new ArrayList<PImage>();
    playerIdleUp = new ArrayList<PImage>();
    playerIdleLeft = new ArrayList<PImage>();
    playerIdleRight = new ArrayList<PImage>();
    playerWalkDown = new ArrayList<PImage>();
    playerWalkUp = new ArrayList<PImage>();
    playerWalkLeft = new ArrayList<PImage>();
    playerWalkRight = new ArrayList<PImage>();

    spritesPlayer = new ArrayList<ArrayList>();
    spriteVez = new ArrayList<PImage>();

    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/IDLE/DOWN/"+i+".png");
      playerIdleDown.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/IDLE/UP/"+i+".png");
      playerIdleUp.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/IDLE/LEFT/"+i+".png");
      playerIdleLeft.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/IDLE/RIGHT/"+i+".png");
      playerIdleRight.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/WALK/DOWN/"+i+".png");
      playerWalkDown.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/WALK/UP/"+i+".png");
      playerWalkUp.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/WALK/LEFT/"+i+".png");
      playerWalkLeft.add(img);
    }
    for (int i = 1; i<=7; i++) {
      PImage img = loadImage( "PLAYER/WALK/RIGHT/"+i+".png");
      playerWalkRight.add(img);
    }
    PImage img = loadImage( "PLAYER/WALK/RIGHT/"+1+".png");

    this.l = img.width*escalaX;
    this.a = img.height*escalaY;

    spritesPlayer.add(playerIdleDown);
    spritesPlayer.add(playerIdleUp);
    spritesPlayer.add(playerIdleLeft);
    spritesPlayer.add(playerIdleRight);
    spritesPlayer.add(playerWalkDown);
    spritesPlayer.add(playerWalkUp);
    spritesPlayer.add(playerWalkLeft);
    spritesPlayer.add(playerWalkRight);
  }

  void update() {
    contadorAnima +=0.25*deltaTime;
    if (contadorAnima>6) {
      contadorAnima=1;
    }


    x+=velocidade*direcaoX;
    y+=velocidade*direcaoY;

    if (x>width-raio-md) {

      x=(width-md)-raio;
    } else  if (x<me+raio) {

      x=me+raio;
    }

    if (y>(height-mb)-raio) {

      y=(height-mb)-raio;
    } else if (y<mc+raio) {

      y=mc+raio;
    }
  }
  void display() {

    if (piscaHit) {
      hit = 1000;
      piscaHit=false;
      invencivel=true;
    }

    if (hit>0.5f) {
      hit-=15.0f;
      if (((millis()/100)%2==0)) {
        tint(255, 0, 0, 150);
      } else {
        tint(255, 0, 0, 255);
      }
    } else {
      invencivel=false;
    }


    spriteVez = spritesPlayer.get(indexAnima);
    image(spriteVez.get(int(contadorAnima)), x-l/2, y-a/2, l, a);
    noTint();

    if (debugMode) {
      stroke(255, 255, 0);
      strokeWeight(5);
      noFill();
      point(x, y);
      strokeWeight(1);
      rect(x-l/2, y-a/2, l, a);
      ellipse(x, y, raio*2, raio*2);
    }
  }


  void apertouKey() {

    if ((keyCode==87)||(keyCode==38)) {
      direcaoY = -1;
      direcaoX=0;
      indexAnima = 5;
    }
    if ((keyCode==83)||(keyCode==40)) {
      direcaoY = 1;
      direcaoX=0;
      indexAnima = 4;
    }
    if ((keyCode==65)||(keyCode==37)) {
      direcaoX = -1;
      direcaoY=0;
      indexAnima = 6;
    }
    if ((keyCode==68)||(keyCode==39)) {
      direcaoX = 1;
      direcaoY=0;
      indexAnima = 7;
    }
    if ((direcaoX!=0)||(direcaoY!=0)) {
      lastDX=direcaoX;
      lastDY=direcaoY;
    }
  }
  void soltouKey() {
    if (!keyPressed) {
      indexAnima = indexAnima>3 ? indexAnima-4 : indexAnima;
      direcaoX=0;
      direcaoY=0;
    }
  }

  void atirou() {
    tiro.rewind();
    tiro.play();
    Shot tiro = new Shot(x, y, 0.75, 0.75, "SHOT.png", lastDX, lastDY, 25);
    tiros.add(tiro);
  }
}
