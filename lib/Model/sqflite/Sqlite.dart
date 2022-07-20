import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Database? _db;

  //Metodos base
  static String deleteTable = "DELETE FROM ? WHERE id = ?";

  //Usuario
  static String usuario = "usuario";
  static String criarUsuario = "CREATE TABLE usuario(id INTEGER PRIMARY KEY)";
  static String insertUsuario = "INSERT INTO usuario (nome, telefone, email, senha) VALUES (?,?,?,?)";
  static String updateUsuario = "UPDATE usuario SET nome = ?, telefone = ?, email = ?, senha = ? WHERE id = ?";

  //Item
  static String item = "item";
  static String criarItem = "CREATE TABLE item(id INTEGER PRIMARY KEY)";
  static String insertItem = "INSERT INTO item (nome, descricao, ataque, defesa, agilidade, mana, predefinicao) VALUES (?,?,?,?,?,?,?)";
  static String updateItem = "UPDATE item SET nome = ?, descricao = ?, ataque = ?, defesa = ?, agilidade = ?, mana = ?, predefinicao = ? WHERE id = ?";

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'bancosqlf.db');
      deleteDatabase(path);
      _db = await openDatabase(path,
          version: 1,
      onCreate: (db, v) {
        db.execute(criarUsuario);
        db.execute(criarItem);
      });
    }
    return _db;
  }

  static Future<int?> salvarUsuario(String nome, String telefone, String email, String senha, [int? id]) async {

    get();

    String sql;
    Future<int>? linhasAfetadas;
    if (id == null) {
      sql = insertUsuario;
      linhasAfetadas = _db?.rawInsert(sql, [nome, telefone, email, senha]);
    } else {
      sql = updateUsuario;
      linhasAfetadas = _db?.rawUpdate(sql, [nome, telefone, email, senha, id]);
    }

    return linhasAfetadas;
  }

  static Future<void> deletarUsuario([int? id]) async {

    get();

    if (id == null) {
      String sql;
      sql = deleteTable;
      _db?.rawDelete(sql, [usuario, id]);
    }
  }



  static Future<int?> salvarItem(String nome, String descricao, double ataque, double defesa,
      double agilidade, int mana, bool predefinicao, [int? id]) async {

    get();

    String sql;
    Future<int>? linhasAfetadas;
    if (id == null) {
      sql = insertUsuario;
      linhasAfetadas = _db?.rawInsert(sql, [nome, descricao, ataque, defesa, agilidade, mana, predefinicao]);
    } else {
      sql = updateUsuario;
      linhasAfetadas = _db?.rawUpdate(sql, [nome, descricao, ataque, defesa, agilidade, mana, predefinicao, id]);
    }

    return linhasAfetadas;
  }

  static Future<void> deletarItem([int? id]) async {

    get();

    if (id == null) {
      String sql;
      sql = deleteTable;
      _db?.rawDelete(sql, [item, id]);
    }
  }

}