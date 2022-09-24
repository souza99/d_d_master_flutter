import 'package:flutter/material.dart';
import 'package:path/path.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

import '../Domain/Classe.dart';

class HabilidadeCadastro extends StatelessWidget {
  HabilidadeCadastro({Key? key}) : super(key: key);

  late int? id = null;
  late String descricao = '';
  late String tipo = '';
  late double porcentagem = 0.0;
  late String nome = '';

  // Future<int> salvarHabilidade(String nome, String descricao, String tipo,
  //     double porcentagem, bool padrao,
  //     [int? id]) async {
  //   String caminho = join(await getDatabasesPath(), 'banco');
  //   Database banco = await openDatabase(caminho, version: 1);
  //
  //   String sql;
  //   Future<int> linhasAfetadas;
  //   //Insere no banco
  //   if (id == null) {
  //     sql =
  //         'INSERT INTO habilidade (nome, descricao, tipo, porcentagem, padrao) VALUES (?,?,?,?,?)';
  //     linhasAfetadas =
  //         banco.rawInsert(sql, [nome, descricao, tipo, porcentagem, padrao]);
  //   }
  //   // atualiza o valor no banco
  //   else {
  //     sql =
  //         'UPDATE habilidade SET nome = ? descricao = ?, tipo = ?, porcentagem = ?, padrao = ? WHERE id = ?';
  //     linhasAfetadas = banco
  //         .rawUpdate(sql, [nome, descricao, tipo, porcentagem, padrao, id]);
  //   }
  //   return linhasAfetadas;
  // }

  @override
  Widget build(BuildContext context) {

    var argumento = ModalRoute.of(context)?.settings.arguments;

    if (argumento != null) {
      Map<String, Object?> habilidade = argumento as Map<String, Object?>;
      id = habilidade['id'] as int;
      nome = habilidade['nome'] as String;
      descricao = habilidade['descricao'] as String;
      tipo = habilidade['tipo'] as String;
      porcentagem = habilidade['porcentagem'] as double;

    }

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
                  onChanged: (value) => nome = value,
                  keyboardType: TextInputType.text,
                    initialValue: nome,
                  decoration: const InputDecoration(
                    label: Text("Nome:"),
                    hintText: "Ex: Ataque furioso.",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => descricao = value,
                  keyboardType: TextInputType.text,
                    initialValue: descricao,
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
                  keyboardType: TextInputType.text,
                    initialValue: tipo,
                  decoration: const InputDecoration(
                    label: Text("Tipo: "),
                    hintText: "Ex: Magica",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => porcentagem = double.tryParse(value)!,
                  keyboardType: TextInputType.text,
                    initialValue: porcentagem.toString(),
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
                    Sqlite.Sqflite.salvarHabilidade(nome, descricao, tipo, porcentagem, id);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
