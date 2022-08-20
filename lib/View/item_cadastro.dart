import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

class ItemCadastro extends StatelessWidget {

  ItemCadastro({Key? key}) : super(key: key);

  late int? id = null;
  late String nome = '';
  late String descricao = '';
  late double ataque = 0.0;
  late double defesa = 0.0;
  late double agilidade = 0.0;
  late int mana = 0;
  late bool predefinido = false;

  @override
  Widget build(BuildContext context) {

    var argumento = ModalRoute.of(context)?.settings.arguments;

    if (argumento != null) {
      Map<String, Object?> item = argumento as Map<String, Object?>;
      id = item['id'] as int;
      nome = item['nome'] as String;
      descricao = item['descricao'] as String;
      ataque = item['ataque'] as double;
      defesa = item['defesa'] as double;
      agilidade = item['agilidade'] as double;
      mana = item['mana'] as int;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Item", textAlign: TextAlign.center,),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => nome = value,
                keyboardType: TextInputType.text,
                initialValue: nome,
                decoration: const InputDecoration(
                  label: Text("Nome:"),
                  hintText: "Ex: Espada longa",
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => descricao = value,
                keyboardType: TextInputType.text,
                initialValue: descricao,
                decoration: const InputDecoration(
                  label: Text("Descricao:"),
                  hintText: "Ex: Espada com uma lamina longa",
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => ataque = double.parse(value),
                keyboardType: TextInputType.text,
                initialValue: ataque.toString(),
                decoration: const InputDecoration(
                  label: Text("Ataque:"),
                  hintText: "Ex: 15.0",
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => defesa = double.parse(value),
                keyboardType: TextInputType.text,
                initialValue: defesa.toString(),
                decoration: const InputDecoration(
                  label: Text("Defesa:"),
                  hintText: "Ex: 5.0",
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => agilidade = double.parse(value),
                keyboardType: TextInputType.text,
                initialValue: agilidade.toString(),
                decoration: const InputDecoration(
                  label: Text("Agilidade:"),
                  hintText: "Ex: -7.0",
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => mana = int.parse(value),
                keyboardType: TextInputType.text,
                initialValue: mana.toString(),
                decoration: const InputDecoration(
                  label: Text("Mana:"),
                  hintText: "Ex: 0",
                ),
              ),
            ),

            Padding(padding: const EdgeInsets.all(15),
              child: ElevatedButton(
                child: const Text("Salvar"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  Sqlite.Sqflite.salvarItem(nome, descricao, ataque, defesa, agilidade, mana, predefinido, id);
                  Navigator.pop(context);
                },
              ),
            ),

          ],
        ),
      )
    );
  }

}