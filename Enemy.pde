class Enemy extends Actor {

  Enemy(String urlImg, int frames) {
    super(urlImg, 500, 300, 1.0f, 1.0f, 18, 1, frames);
    tag=3;
  }

  @Override  void display() {
    contador += 0.1f*deltaTime;
    if (contador>duracaoCadaFrame) {
      if (frame<frames) {
        frame++;
      } else {
        frame=1;
      }
      contador = 0.0f;
    }
            
    if( direcaoX==1){
    pushMatrix();
    scale(-1,1.0);
    image(imagens.get(frame%frames), -x-l*scaleX/2, y-a*scaleY/2, l, a);
    popMatrix();
    }else{
    image(imagens.get(frame%frames), x-l*scaleX/2, y-a*scaleY/2, l, a);
    }


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
