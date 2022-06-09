class MessageBoxArray
{
    ArrayList<MessageBox> mensagens;
    String key;
    String imagem;
    MessageBoxArray(String key, String imagem) {
        this.key = key;
        this.imagem = imagem;
    }

    void exibe_tudo () {
        mensagens = new ArrayList<MessageBox>();
        JSONObject arquivo = loadJSONObject("dados.json");
        JSONObject json = arquivo.getJSONObject(key);
        for ( int i=0; i < json.size(); i++ ) {
            MessageBox m = new MessageBox(json.getString(""+i), imagem);
            println(""+i);
            println(json.getString(""+i));
            mensagens.add(m);
        }
        for (int i=0; i<mensagens.size(); i++) {
            MessageBox m = mensagens.get(i);
            if (m.ativo) {
                print("update");
                m.update();
            } else {
                mensagens.remove(i);
            }
        }
    }
}
