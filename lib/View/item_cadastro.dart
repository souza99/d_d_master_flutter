import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

class UsuarioCadastro extends StatelessWidget {

  UsuarioCadastro({Key? key}) : super(key: key);

  late int? id;
  late String descricao;
  late String nome;
  late double ataque;
  late double defesa;
  late double agilidade;
  late int mana;
  late bool predefinido;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Item", textAlign: TextAlign.center,),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => nome = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Nome:"),
                  hintText: "Ex: Espada longa",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => descricao = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Descricao:"),
                  hintText: "Ex: Espada com uma lamina longa",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => nome = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Ataque:"),
                  hintText: "Ex: 15.0",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => nome = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Defesa:"),
                  hintText: "Ex: 5.0",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => nome = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Agilidade:"),
                  hintText: "Ex: -7.0",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => nome = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Mana:"),
                  hintText: "Ex: 0.0",
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
    throw UnimplementedError();
  }

}