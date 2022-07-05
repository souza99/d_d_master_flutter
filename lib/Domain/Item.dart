class Item {
  late int _id;
  late String _descricao;
  late String _nome;
  late double _ataque;
  late double _defesa;
  late double _agilidade;
  late int _mana;
  late bool _predefinido;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get descricao => _descricao;

  set descricao(String descricao) {
    _descricao = descricao;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  double get ataque => _ataque;

  set ataque(double ataque) {
    _ataque = ataque;
  }

  double get defeza => _defesa;

  set defeza(double defeza) {
    _defesa = defeza;
  }

  double get agiliade => _agilidade;

  set agiliade(double agiliade) {
    _agilidade = agiliade;
  }

  int get mana => _mana;

  set mana(int mana) {
    _mana = mana;
  }

  bool get predefinido => _predefinido;

  set predefinido(bool predefinido) {
    _predefinido = predefinido;
  }
}
