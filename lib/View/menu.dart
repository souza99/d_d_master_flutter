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
        backgroundColor: Colors.green,
        title: Text("RPG Master"),
      ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 50,),
                SizedBox(height: 40,),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Email',
                    hintText: 'Escreva seu e-mail',
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.black, size: 18, ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    labelText: 'Senha',
                    hintText: 'Escreva sua senha',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Icons.key, color: Colors.black, size: 18, ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Esqueceu a senha?', style: TextStyle(color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                MaterialButton(
                  onPressed: (){},
                  height: 45,
                  color: Colors.black,
                  child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Não tem uma conta?', style: TextStyle(color: Colors.grey.shade600, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    TextButton(
                      onPressed: () {},
                      child: Text('Registrar-se', style: TextStyle(color: Colors.blue, fontSize: 14.0, fontWeight: FontWeight.w400),),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
    );

      // Scaffold(
      //   appBar: AppBar(
      //     title: const Center(child: Text("Rpg Master")),
      //     backgroundColor: colors.Cores().Verde(),
      //   ),
      //   body: Center(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         ElevatedCardExample(),
      //         Card(),
      //         Container(
      //           width: 300,
      //           child: Card(
      //             shape: RoundedRectangleBorder(
      //               borderRadius: BorderRadius.circular(10.0),
      //             ),
      //             elevation: 10,
      //             child: SizedBox(
      //               width: 300,
      //               height: 150,
      //               child: Center(
      //                   child: Column(
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: TextFormField(
      //                       decoration: const InputDecoration(
      //                         label: Text("E-mail"),
      //                         hintText: "Digite seu email",
      //                       ),
      //                       onChanged: (value) => email = value,
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(8.0),
      //                     child: TextFormField(
      //                       decoration: const InputDecoration(
      //                         label: Text("Senha"),
      //                         hintText: "Digite sua senha",
      //                       ),
      //                       onChanged: (value) => senha = value,
      //                     ),
      //                   ),
      //                 ],
      //               )),
      //             ),
      //           ),
      //         ),
      //         criarBotao("Olá mundo!", () => print("Hello World")),
      //         criarBotao("Calcular idade",
      //             () => Navigator.pushNamed(context, "/calcularIdade")),
      //         criarBotao("Hello World",
      //             () => Navigator.pushNamed(context, "/helloWorld")),
      //         criarBotao("Calculadora",
      //             () => Navigator.pushNamed(context, "/calculadora"))
      //       ],
      //     ),
      //   ));
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
