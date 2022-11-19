import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ações do sistema"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/'),
                        child: const Text("Começar campanha")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/habilidadeListagem'),
                        child: const Text("Lista habilidade")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/itemLista'),
                        child: const Text("Lista de item")),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/listaPersonagem'),
                        child: const Text("Lista de personagem")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: ElevatedButton(
                        onPressed: () =>
                            Navigator.pushNamed(context, '/dado'),
                        child: const Text("Dados")),
                  )
                ],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
