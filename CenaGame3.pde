class CenaGame3 extends Scene {

  Relogio relogio;
  int tempoCena=100;
  Actor fofura;

  Hud hud;

  ArrayList<Actor> listaItens;
  ArrayList<Enemy> inimigos;

  ArrayList<Star> estrelas;
  ArrayList<Explosao> explosoes;
  Scene proxima;

  PImage imagemFundo;

  JSONObject json = loadJSONObject("dados.json"); // carrega o arquivo json //<>// //<>//
  JSONObject textos_box = json.getJSONObject("stringFase");
  String fase = textos_box.getString("fase3");

  CenaGame3() {
    listaItens = new ArrayList<Actor>();
    inimigos = new ArrayList<Enemy>();
    tiros = new ArrayList<Shot>();
    estrelas = new ArrayList<Star>();
    explosoes = new ArrayList<Explosao>();
    mensagens = new ArrayList<MessageBox>();

    hud = new Hud();
    fofura = new Actor("FOFURA", 360, 65, 1, 1, 60, 1, 7);

    jogador = new Player(120, 120, 0.8, 0.8, 30);
    jogador.velocidade = 3;

    espacoX = (width-me-md)/colunas;
    espacoY = (height-mc-mb)/linhas;

    imagemFundo = loadImage("BACKGROUND.jpg");
    gridPontos = meuDebug.obterGrid();

    String fase1 = fase;

     for (int i=0; i<fase1.length(); i++) {
      char c = fase1.charAt(i);

      switch(c) {
      case 'X':
        break;
      case 'M':
        Actor moeda = new Actor ("MOEDA", gridPontos [i][0], gridPontos[i][1], 1, 1, 17, 1, 6);
        moeda.tag=1;
        listaItens.add(moeda);

        break;
      case 'E':
        Enemy inimigo = new Enemy("LESMO", 8);
        inimigo.x=gridPontos [i][0];
        inimigo.y=gridPontos [i][1];
        if (int(random(0.2))%2==0) {
          inimigo.direcaoX=-1;
        } else {
          inimigo.direcaoX=1;
        }
        inimigo.velocidade=2;
        inimigos.add(inimigo);
        break;

        case 'B':
        Enemy outro = new Enemy("BUGADO", 6);
        outro.x=gridPontos [i][0];
        outro.y=gridPontos [i][1];
        if (int(random(0.2))%2==0) {
          outro.direcaoX=-1;
        } else {
          outro.direcaoX=1;
        }
        outro.velocidade=4;
        inimigos.add(outro);
        break;

      case 'P':
        Actor peninha = new Actor("PENINHA", gridPontos [i][0], gridPontos[i][1], 1, 1, 17, 1, 7);
        peninha.tag=2;
        listaItens.add(peninha);

        break;
      }
    }

    relogio = new Relogio();
    relogio.start();
  }

  @Override void update() {
    if (!acabou) {
      tempo= tempoCena-relogio.segundo();
      if (tempo<=0) {
        gameOver("Tempo Acabou");
        relogio.stop();
      }
    }
  }

  void display() {
    background(imagemFundo);

    for (int i=0; i<listaItens.size(); i++) {
      Actor m = listaItens.get(i);
      float distMoeda = dist(jogador.x, jogador.y, m.x, m.y);
      if (distMoeda < (jogador.raio+m.raio)) {
        if (m.tag==1) {
          hud.pegouMoeda();
          listaItens.remove(i);
          pontos+=1;
          addStar(m.x, m.y);
        } else if (m.tag==2) {
          hud.pegouPeninha();
          listaItens.remove(i);
          pontos+=2;
          addStar(m.x, m.y);
        }
      }
      m.display();
      m.update();
    }

    for (int i=0; i<inimigos.size(); i++) {
      Actor e = inimigos.get(i);
      if (!acabou) {
        float distInimigo = dist(jogador.x, jogador.y, e.x, e.y);
        if (distInimigo < (jogador.raio+e.raio) && !invencivel) {

          hud.apanhou();
          jogador.x += -jogador.direcaoX*50;
          jogador.y += -jogador.direcaoY*50;
          jogador.piscaHit=true;
        }
      }
      e.display();
      e.update();
    }

    for (int i=0; i<inimigos.size(); i++) {
      Enemy e = inimigos.get(i);
      for (int j=0; j<tiros.size(); j++) {
        Shot s = tiros.get(j);
        float distShot = dist(s.x, s.y, e.x, e.y);
        if (distShot<(e.raio+s.raio)) {
          inimigos.remove(i);
          tiros.remove(j);
          pontos+=10;
          Explosao exp = new Explosao();
          exp.x=e.x;
          exp.y=e.y;
          explosoes.add(exp);

          if (inimigos.size()==0) {
            acabou=true;
            mensagemFimDeJogo = "Destruiu Tudo";
          }
        }
      }
    }

    for (int i=0; i<estrelas.size(); i++) {
      Star s = estrelas.get(i);

      if (!s.ativo) {
        estrelas.remove(i);
      } else {
        s.update();
        s.display();
      }
    }

    for (int i=0; i<explosoes.size(); i++) {
      Explosao s = explosoes.get(i);

      if (!s.ativo) {
        explosoes.remove(i);
      } else {
        s.update();
        s.display();
      }
    }

    for (Shot s : tiros) {
      s.update();
      s.display();
    }

    float distFofura = dist (jogador.x, jogador.y, fofura.x, fofura.y);
    if (distFofura<jogador.raio+fofura.raio) {
      if (mensagens.size()==0) {
        MessageBox msgb = new MessageBox ("Oi, eu sou a Fofura! Mate todos os inimigos que estão me incomodando!", "icone_fofura.png");
        mensagens.add(msgb);
      }
    }

    fofura.update();
    fofura.display();

    jogador.update();
    jogador.display();

    hud.update();
    hud.display();

    for (int i=0; i<mensagens.size(); i++) {
      MessageBox m = mensagens.get(i);
      if (m.ativo) {
        m.update();
      } else {
        mensagens.remove(i);
      }
    }

    if (acabou) {
      mensagemFimDeJogo();
    }
  }

  void addStar(float px, float py) {
    Star s = new Star(px, py, 0.5, 0.5);
    estrelas.add(s);
  }

  void proximaFase() {
    proxima.ativo=true;
    ativo=false;
  }

  void defineProximaFase(Scene fase) {
    proxima = fase;
  }
}
