import 'dart:math';

class GeraValor {
  static List<int>? gareValorDado(int tamanhoDado, int qtdaDados) {
    List<int> listaDados = [];

    var numeros = new Random();
    for (var i = 0; i <= qtdaDados; i++) {
      listaDados.add(numeros.nextInt(tamanhoDado));
    }
    return listaDados;
  }
}
