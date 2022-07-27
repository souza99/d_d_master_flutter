import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Database? _db;

  //Usuario
  static String usuario = "usuario";
  static String criarUsuario = "CREATE TABLE usuario(id INTEGER PRIMARY KEY, nome TEXT, telefone TEXT, email TEXT, senha TEXT)";
  static String insertUsuario =
      "INSERT INTO usuario (nome, telefone, email, senha) VALUES (?,?,?,?)";
  static String updateUsuario =
      "UPDATE usuario SET nome = ?, telefone = ?, email = ?, senha = ? WHERE id = ?";

  //Item
  static String item = "item";
  static String criarItem = '''CREATE TABLE item(id INTEGER PRIMARY KEY, nome TEXT,
   descricao TEXT, ataque DOUBLE, defesa DOUBLE, agilidade DOUBLE, mana DOUBLE, predefinicao BOOLEAN)''';
  static String insertItem =
      "INSERT INTO item (nome, descricao, ataque, defesa, agilidade, mana, predefinicao) VALUES (?,?,?,?,?,?,?)";
  static String updateItem =
      "UPDATE item SET nome = ?, descricao = ?, ataque = ?, defesa = ?, agilidade = ?, mana = ?, predefinicao = ? WHERE id = ?";

  //Personagem
  static String personagem = "personagem";
  static String criarPersonagem =
      "CREAT TABLE personagem(id INTEGER PRIMARY KEY, nome TEXT, nivel INTEGER, vida INTEGER, classe_id INTEGER)";
  static String inserirPersonagem =
      "INSERT INTO personagem (nome, nivel, vida, classe_id) VALUES (?,?,?,?)";
  static String atualizarpersonagem =
      "UPDATE personagem SET nome = ?, nivel = ?, vida = ?, classe = ?";

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'bancosqlf.db');
      deleteDatabase(path);
      _db = await openDatabase(path, version: 1, onCreate: (db, v) {
        db.execute(criarUsuario);
        db.execute(criarItem);
      });
    }
    return _db;
  }

  static Future<int?> salvarUsuario(
      String nome, String telefone, String email, String senha,
      [int? id]) async {
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

    if (id != null) {
      String sql;
      sql = "DELETE FROM usuario WHERE id = ?";
      _db?.rawDelete(sql, [id]);
    }
  }

  static Future<int?> salvarItem(String nome, String descricao, double ataque,
      double defesa, double agilidade, int mana, bool predefinicao,
      [int? id]) async {
    get();

    String sql;
    Future<int>? linhasAfetadas;
    if (id == null) {
      sql = insertItem;
      linhasAfetadas = _db?.rawInsert(sql,
          [nome, descricao, ataque, defesa, agilidade, mana, predefinicao]);
    } else {
      sql = updateItem;
      linhasAfetadas = _db?.rawUpdate(sql,
          [nome, descricao, ataque, defesa, agilidade, mana, predefinicao, id]);
    }

    return linhasAfetadas;
  }

  static Future<void> deletarItem([int? id]) async {

    get();

    if (id != null) {
      String sql;
      sql = "DELETE FROM item WHERE id = ?";
      _db?.rawDelete(sql, [id]);
    }
  }

  static Future<Future<int>?> salvarPersonagem(
      String nome, int nivel, double vida, int classe_id,
      [int? id]) async {
    get();

    String sql;
    Future<int>? linhasAfetadas;
    if (id == null) {
      sql = inserirPersonagem;
      linhasAfetadas = _db?.rawInsert(sql, [nome, nivel, vida, classe_id]);
    } else {
      sql = atualizarpersonagem;
      linhasAfetadas = _db?.rawUpdate(sql, [nome, nivel, vida, classe_id, id]);
    }

    return linhasAfetadas;
  }

  static Future<void> deletarPersonagem([int? id]) async {
    get();

    if (id != null) {
      String sql;
      sql = "DELETE FROM personagem WHERE id = ?";
      _db?.rawDelete(sql, [id]);
    }
  }

  static Future<List<Map<String, Object?>>?> buscarDadosItem() async {

    get();

    List<Map<String, Object?>>? lista = await _db?.rawQuery('SELECT * FROM item');
    return lista;
  }

}
