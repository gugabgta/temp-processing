
String mensagem = "Ola eu sou o felpudo!";

class MessageBox {
  PImage icon;

  float m_esq = 20;
  float m_dir = 20;
  float m_sup = 0;
  float m_inf = 20;

  float m=10;
  float a_box = 120;
  PFont arial;

  boolean ativo;
  boolean podeApertar = false;
  int contador=0;

  MessageBox(String msg, String img) {
    mensagem = msg;
    ativo = true;
    icon = loadImage(img);
    arial = createFont("Arial", 12);
  }

  void update() {

    if (ativo==true) {
      String texto = mensagem.substring(0, contador);
      fill(50, 50, 50, 100);
      strokeWeight(2);
      stroke(255);
      rect(m_esq, height-m_inf-a_box, width-(m_esq+m_dir), a_box, 12);
      tint(230, 230);
      image(icon, m_esq+m, m+height-m_inf-a_box, a_box-2*m, a_box-2*m);
      noTint();
      fill(255);
      textAlign(LEFT, BOTTOM);
      textFont(arial);
      textSize(12);
      text(texto, m_esq+a_box, m+height-m_inf-a_box, width-(m_esq+m_dir)-2*m-a_box, a_box-2*m);

      if (contador<mensagem.length()) {
        contador++;
      } else {
        if (!acabou) {
          textSize(12);
          textAlign(RIGHT, BOTTOM);
          text("Aperte X para continuar!", 0, 0, width-30, height-a_box);
          if (!podeApertar) {
            podeApertar=true;
          }
        }
      }
    }

    if (keyPressed) {
      if (((key=='x')||(key=='X'))&&(podeApertar==true)) {
        ativo=false;
        podeApertar=false;
        contador=0;
      }
    }
  }
}
