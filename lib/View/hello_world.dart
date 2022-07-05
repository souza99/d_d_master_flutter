import 'package:flutter/material.dart';

class HelloWorld extends StatelessWidget {
  String? nome;
  mostrarResultado(String resultado, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              resultado,
              style: TextStyle(fontSize: 35),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              label: Text("Nome"),
              hintText: "Digite seu nome",
            ),
            onChanged: (value) => nome = value,
          ),
          ElevatedButton(
            child: const Text("Dizer Olá"),
            onPressed: () {
              mostrarResultado("Olá $nome!", context);
            },
          ),
        ],
      ),
    );
  }
}
