class Menu extends Scene {

  PImage img_felpudo;
  float fl;
  float fa;

  Menu() {
    super();

    img_felpudo = loadImage("felpudo_google_glass.png");
    fl = img_felpudo.width*0.9;
    fa = img_felpudo.height*0.9;
  }

  @Override void update() {
  }
  @Override void display() { 
    //fill(#ab9758);
    fill(255);
    //background(#ab9758);
    background(#E5DE07);
    fill(50);
    noStroke();
    fill(30);
    rect( 0, 40, width, 80);
    textAlign(CENTER, TOP);
    textFont(minhaFonte);
    textSize(52);
    fill(#d00b1c);
    text("The Legend of Felpudo", 0, 60, width, 160); 
    pushMatrix(); 
    scale(-1, 1.0); 
    image(img_felpudo, -width/2-fl/2, height-fa-20, fl, fa);
    popMatrix();
  }
}
