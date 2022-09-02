import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Domain/Classe.dart';

class PersonagemCadastro extends StatelessWidget {
  PersonagemCadastro({Key? key}) : super(key: key);

  late int? id = null;
  late String nome;
  late int? nivel;
  late double? vida;
  //late List<Item> iventario;
  late int? classe_id;

  Future<int> salvarPersonagem(
      String nome, int nivel, double vida, int classe_id,
      [int? id]) async {
    String caminho = join(await getDatabasesPath(), 'banco');
    Database banco = await openDatabase(caminho, version: 1);

    String sql;
    Future<int> linhasAfetadas;
    if (id == null) {
      sql =
          'INSERT INTO personagem (nome, nivel, vida, classe_id) VALUES (?,?,?,?)';
      linhasAfetadas = banco.rawInsert(sql, [
        nome,
        nivel,
        vida,
      ]);
    } else {
      sql =
          'UPDATE personagem SET nome = ?, nivel = ?, vida = ?, classe_id = ? WHERE id = ?';
      linhasAfetadas = banco.rawUpdate(sql, [nome, nivel, vida, classe_id, id]);
    }
    return linhasAfetadas;
  }

  @override
  Widget build(BuildContext context) {
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
                  decoration: const InputDecoration(
                    label: Text("Nome:"),
                    hintText: "Ex: Cavaleiro de Dragão fenHur",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => nivel = int.tryParse(value),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Nivel: "),
                    hintText: "Ex: 18",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => vida = double.tryParse(value),
                  keyboardType: TextInputType.number,
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
                    salvarPersonagem(nome, nivel!, vida!, classe_id!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
