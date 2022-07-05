import 'package:flutter/material.dart';

class CalcularIdade extends StatelessWidget {
  String? nome;
  int? anoNascimento;

  mostrarResultado(String resultado, BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              resultado,
              style: TextStyle(fontSize: 50),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calcular Idade",
          style: TextStyle(fontSize: 50),
        ),
      ),
      body: Column(
        children: [
          TextField(
            decoration: const InputDecoration(
                label: Text("Nome:"), hintText: "Digite o seu nome completo"),
            onChanged: (valorDigitado) => nome = valorDigitado,
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                label: Text("Data nascimento:"),
                hintText: "Digite o ano que nasceu"),
            onChanged: (valorDigitado) =>
                anoNascimento = int.parse(valorDigitado),
          ),
          ElevatedButton(
            child: const Text("Calcular idade"),
            onPressed: () {
              var anoAtual = DateTime.now().year;
              var idade = anoAtual - anoNascimento!;
              mostrarResultado(idade.toString(), context);
            },
          )
        ],
      ),
    );
  }
}
