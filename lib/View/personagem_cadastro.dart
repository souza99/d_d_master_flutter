import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

import '../Domain/Classe.dart';

class PersonagemCadastro extends StatelessWidget {
  PersonagemCadastro({Key? key}) : super(key: key);

  late int? id = null;
  late String nome = '';
  late int nivel = 0;
  late int vida = 0;
  //late List<Item> iventario;
  late int classe_id = 1;

  // Future<int> salvarPersonagem(
  //     String nome, int nivel, double vida, int classe_id,
  //     [int? id]) async {
  //   String caminho = join(await getDatabasesPath(), 'banco');
  //   Database banco = await openDatabase(caminho, version: 1);
  //
  //   String sql;
  //   Future<int> linhasAfetadas;
  //   if (id == null) {
  //     sql =
  //         'INSERT INTO personagem (nome, nivel, vida, classe_id) VALUES (?,?,?,?)';
  //     linhasAfetadas = banco.rawInsert(sql, [
  //       nome,
  //       nivel,
  //       vida,
  //     ]);
  //   } else {
  //     sql =
  //         'UPDATE personagem SET nome = ?, nivel = ?, vida = ?, classe_id = ? WHERE id = ?';
  //     linhasAfetadas = banco.rawUpdate(sql, [nome, nivel, vida, classe_id, id]);
  //   }
  //   return linhasAfetadas;
  // }

  @override
  Widget build(BuildContext context) {

    var argumento = ModalRoute.of(context)?.settings.arguments;

    if (argumento != null) {
      Map<String, Object?> personagem = argumento as Map<String, Object?>;
      id = personagem['id'] as int;
      nome = personagem['nome'] as String;
      nivel = personagem['nivel'] as int;
      vida = personagem['vida'] as int;
      classe_id = personagem['classe_id'] as int;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cadastro de Personagem",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => nome = value,
                  keyboardType: TextInputType.text,
                    initialValue: nome,
                  decoration: const InputDecoration(
                    label: Text("Nome:"),
                    hintText: "Ex: Cavaleiro de Dragão fenHur",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => nivel = int.tryParse(value)!,
                  keyboardType: TextInputType.number,
                    initialValue: nivel.toString(),
                  decoration: const InputDecoration(
                    label: Text("Nivel: "),
                    hintText: "Ex: 18",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => vida = int.tryParse(value)!,
                  keyboardType: TextInputType.number,
                    initialValue: vida.toString(),
                  decoration: const InputDecoration(
                    label: Text("Vida:"),
                    hintText: "Ex: 200",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  child: const Text("Salvar"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    Sqlite.Sqflite.salvarPersonagem(nome, nivel, vida, classe_id, id);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
