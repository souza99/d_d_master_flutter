import 'package:rpg_d_d_flutter/View/menu.dart';
import 'package:flutter/material.dart';

class Calculadora extends StatelessWidget {
  int? valor1;
  int? valor2;

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

  String calcularSoma(int valor1, int valor2, BuildContext context) {
    String resposta = "$valor1 + $valor2 = ${valor1 + valor2} ";
    mostrarResultado(resposta, context);
    return resposta;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Digite um valor"),
            TextFormField(
              decoration: const InputDecoration(
                  label: Text("Valor"), hintText: "Digite o valor 1"),
              onChanged: (value) {
                valor1 = int.parse(value);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("1"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("2"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("3"),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("4"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("5"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("6"),
                  onPressed: () {},
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("7"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("8"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: Text("9"),
                  onPressed: () {},
                ),
              ],
            ),
            ElevatedButton(
              child: Text("0"),
              onPressed: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text("+"),
                  onPressed: () {
                    calcularSoma(valor1!, valor2!, context);
                  },
                ),
                ElevatedButton(
                  child: Text("-"),
                  onPressed: () {
                    calcularSoma(valor1!, valor2!, context);
                  },
                ),
                ElevatedButton(
                  child: Text("="),
                  onPressed: () {
                    calcularSoma(valor1!, valor2!, context);
                  },
                ),
              ],
            ),
            Menu().criarBotao("Calcular", () {
              var valor1 = 0;
              var valor2 = 0;
              var soma = valor1 + valor2;
            }),
          ],
        ),
      ),
    );
  }
}
