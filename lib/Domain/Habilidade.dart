class Habilidade {
  late int _id;
  late String _descricao;
  late String _tipo;
  late double _porcentagem;
  late String _nome;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

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

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }
}
