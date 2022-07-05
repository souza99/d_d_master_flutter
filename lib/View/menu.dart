import 'package:flutter/material.dart';
import '../Styles/colors.dart' as colors;

class Menu extends StatelessWidget {
  String? email;
  String? senha;
  Widget criarBotao(String nomeBotao, VoidCallback? acaoBotao) {
    return ElevatedButton(
      child: Text(nomeBotao),
      onPressed: acaoBotao,
    );
  }

  @override
  Widget build(BuildContext context) {
    var primeiroBotao = ElevatedButton(
      child: const Text("Primeiro Botão"),
      onPressed: () {
        print('Hello world');
      },
    );

    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Rpg Master")),
          backgroundColor: colors.Cores().Verde(),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedCardExample(),
              Card(),
              Container(
                width: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 10,
                  child: SizedBox(
                    width: 300,
                    height: 150,
                    child: Center(
                        child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("E-mail"),
                              hintText: "Digite seu email",
                            ),
                            onChanged: (value) => email = value,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              label: Text("Senha"),
                              hintText: "Digite sua senha",
                            ),
                            onChanged: (value) => senha = value,
                          ),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
              criarBotao("Olá mundo!", () => print("Hello World")),
              criarBotao("Calcular idade",
                  () => Navigator.pushNamed(context, "/calcularIdade")),
              criarBotao("Hello World",
                  () => Navigator.pushNamed(context, "/helloWorld")),
              criarBotao("Calculadora",
                  () => Navigator.pushNamed(context, "/calculadora"))
            ],
          ),
        ));
  }
}

class ElevatedCardExample extends StatelessWidget {
  const ElevatedCardExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Elevated Card')),
        ),
      ),
    );
  }
}
