class Relogio {

  int startTime = 0;
  int stopTime = 0;

  boolean ativo = false;

  void start() {
    startTime = millis();
    ativo=true;
  }
  void stop() {
    stopTime = millis();
    ativo=false;
  }

  int obterTempo() {

    int tempoDecorrido;

    if (ativo) {
      tempoDecorrido = (millis() - startTime);
    } else {
      tempoDecorrido = (stopTime - startTime);
    }
    return tempoDecorrido;
  }


  int segundo() {
    return (obterTempo() / 1000) % 60;
  }
  int minuto() {
    return (obterTempo() / (1000*60)) % 60;
  }
  int hora() {
    return (obterTempo() / (1000*60*60)) % 24;
  }
}
