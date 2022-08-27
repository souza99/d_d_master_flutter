import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../Domain/Classe.dart';

class HabilidadeCadastro extends StatelessWidget {
  HabilidadeCadastro({Key? key}) : super(key: key);

  late int? id;
  late String? descricao;
  late String? tipo;
  late double? porcentagem;
  late bool? padrao;

  Future<int> salvarHabilidade(
      String nome, String descricao, String tipo, double porcentagem, bool padrao,
      [int? id]) async {
    String caminho = join(await getDatabasesPath(), 'banco');
    Database banco = await openDatabase(caminho, version: 1);

    String sql;
    Future<int> linhasAfetadas;
    //Insere no banco
    if (id == null) {
      sql =
          'INSERT INTO habilidade (nome, descricao, tipo, porcentagem, padrao) VALUES (?,?,?,?,?)';
      linhasAfetadas =
          banco.rawInsert(sql, [nome, descricao, tipo, porcentagem, padrao]);
    }
    // atualiza o valor no banco
    else {
      sql =
          'UPDATE personagem SET descricao = ?, tipo = ?, porcentagem = ?, padrao = ? WHERE id = ?';
      linhasAfetadas =
          banco.rawUpdate(sql, [descricao, tipo, porcentagem, padrao, id]);
    }
    return linhasAfetadas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cadastro de Habilidade",
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
                  onChanged: (value) => descricao = value,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Descricao:"),
                    hintText:
                        "Ex: quando selecionada, realiza ataques em area de 20cm de diametro",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => tipo = value,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Tipo: "),
                    hintText: "Ex: Magica",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => porcentagem = double.tryParse(value),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Porcentagem:"),
                    hintText: "Ex: 4",
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
                    salvarHabilidade(descricao!, tipo!, porcentagem!, padrao!);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
