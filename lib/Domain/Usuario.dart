class Usuario {
  late int _id;
  late String _nome;
  late int _nivel;
  late String _email;
  late String _senha;
  late String _telefone;

  int get id => _id;

  set id(int id) {
    _id = id;
  }

  int get nivel => _nivel;

  set nivel(int nivel) {
    _nivel = nivel;
  }

  String get nome => _nome;

  set nome(String nome) {
    _nome = nome;
  }

  String get email => _email;

  set email(String email) => _email = email;

  String get senha => _senha;

  set senha(String senha) => _senha = senha;

  String get telefone => _telefone;

  set telefone(String telefone) => _telefone = telefone;
}
