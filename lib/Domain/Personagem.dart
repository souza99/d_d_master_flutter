import 'Classe.dart';
import 'Item.dart';

class Personagem {
  late int _id;
  late String _nome;
  late int _nivel;
  late double _vida;
  late List<Item> _inventario;
  late int _classe_id;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  int get nivel => _nivel;

  set nivel(int nivel) {
    _nivel = nivel;
  }

  double get vida => _vida;

  set vida(double vida) {
    _vida = vida;
  }

  List<Item> get item => _inventario;

  set item(List<Item> item) {
    _inventario = item;
  }

  int get classe_id => _classe_id;

  set classe_id(int classe_id) {
    _classe_id = classe_id;
  }
}
