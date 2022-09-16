import 'dart:math';

class geraValor {
  List<int>? gareValorDado(int tamanhoDado, int qtdaDados) {
    List<int> listaDados = [];

    var numeros = new Random();
    for (var i = 0; i <= qtdaDados; i++) {
      listaDados.add(numeros.nextInt(tamanhoDado));
    }
    return listaDados;
  }
}
