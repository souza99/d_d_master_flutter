import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rpg_d_d_flutter/Domain/Habilidade.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

class ClasseCadastro extends StatelessWidget {

  ClasseCadastro({Key? key}) : super(key: key);

  late int? id;
  late List<Habilidade> habilidades = [];
  late int vida;
  late double agilidade;
  late int mana;
  late String nome;
  late double ataque;
  late double defesa;
  late bool predefinido = false;


//https://pub.dev/packages/multiselect_formfield Link multselect


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Classe", textAlign: TextAlign.center,),
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
                  hintText: "Ex: Ataque furios",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => vida = int.parse(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Vida"),
                  hintText: "Ex: 100",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => ataque = double.parse(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Ataque:"),
                  hintText: "Ex: 10",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => defesa = double.parse(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Defesa:"),
                  hintText: "Ex: 10",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => mana = int.parse(value),
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text("Mana"),
                  hintText: "Ex: 100",
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
                  // Sqlite.Sqflite.salvarClasse(nome, telefone, email, senha, id);
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