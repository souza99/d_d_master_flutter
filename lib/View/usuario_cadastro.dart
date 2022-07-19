import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UsuarioCadastro extends StatelessWidget {

  UsuarioCadastro({Key? key}) : super(key: key);

  late int? id;
  late String nome;
  late String telefone;
  late String email;
  late String senha;

  Future<int> salvarUsuario(String nome, String telefone, String email, String senha, [int? id]) async {
    String caminho = join(await getDatabasesPath(), 'banco');
    Database banco = await openDatabase(caminho, version: 1);

    String sql;
    Future<int> linhasAfetadas;
    if (id == null) {
      sql = 'INSERT INTO usuario (nome, telefone, email, senha) VALUES (?,?,?,?)';
      linhasAfetadas = banco.rawInsert(sql, [nome, telefone, ]);
    } else {
      sql = 'UPDATE usuario SET nome = ?, telefone = ?, email = ?, senha = ? WHERE id = ?';
      linhasAfetadas = banco.rawUpdate(sql, [nome, telefone, email, senha, id]);
    }
    return linhasAfetadas;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cadastro de Usuario", textAlign: TextAlign.center,),
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
                  hintText: "Ex: João José da Costa",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => telefone = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("Telefone (Escreva somente os números): "),
                  hintText: "Ex: 01999999999",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => email = value,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  label: Text("E-mail:"),
                  hintText: "Ex: exemplo@email.com",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.all(15),
              child: TextFormField(
                onChanged: (value) => senha = value,
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  label: Text("Senha:"),
                  hintText: "Ex: 123456",
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
                  salvarUsuario(nome, telefone, email, senha, id);
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