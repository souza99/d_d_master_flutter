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
                      child: ElevatedButton(onPressed: () => Navigator.pushNamed(
                          context, '/'), child: const Text("Começar campanha")
                      ),),


                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(onPressed: () => Navigator.pushNamed(
                          context, '/itemLista'), child: const Text("Lista de item")
                      ),),

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: ElevatedButton(onPressed: () => Navigator.pushNamed(
                          context, '/usuarioCadastro'), child: const Text("Cadastro de Usuário")
                      ),),
                  ],
                ),

              ],

            ),
          )
        ),
      ),
    );
  }
}
