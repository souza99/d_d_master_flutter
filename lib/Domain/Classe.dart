import 'Habilidade.dart';

class Classe {
  late int _id;
  late String _nome;
  late List<Habilidade> _habilidades;
  late double _ataque;
  late double _defesa;
  late double _vida;
  late double _agilidade;
  late int _mana;
  late bool _predefinido;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  List<Habilidade> get habilidades => _habilidades;

  set habilidade(List<Habilidade> habilidades) {
    _habilidades = habilidades;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  double get ataque => _ataque;

  set ataque(double ataque) {
    _ataque = ataque;
  }

  double get defesa => _defesa;

  set defesa(double defesa) {
    _defesa = defesa;
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
