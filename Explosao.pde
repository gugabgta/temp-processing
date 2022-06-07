class Explosao extends Actor {

  boolean ativo;
  float conta;

  Explosao() {
    super("EXPLOSAO", 0, 0, 1, 1, 25, 1.5, 10);
    ativo=true;
    conta=0;
  }

  @Override void update() { 
    conta += 0.05*deltaTime;
    if (conta>0.8) {
      ativo=false; 
    }
  }
}
