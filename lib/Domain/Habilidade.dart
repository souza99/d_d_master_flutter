
class Habilidade {
  late String _descricao;
  late String _tipo;
  late double _porcentagem;
  late bool _padrao;

  String get descricao => _descricao;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  String get tipo => _tipo;

  set tipo(String tipo) {
    _tipo = tipo;
  }

  double get porcentagem => _porcentagem;

  set porcentagem(double porcentagem) {
    _porcentagem = porcentagem;
  }

  bool get padrao => _padrao;

  set padrao(bool padrao) {
    _padrao = padrao;
  }
  
}
