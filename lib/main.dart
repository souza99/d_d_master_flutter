import 'package:rpg_d_d_flutter/View/dado.dart';
import 'package:rpg_d_d_flutter/View/habilidade_cadastro.dart';
import 'package:rpg_d_d_flutter/View/habilidade_lista.dart';
import 'package:rpg_d_d_flutter/View/item_cadastro.dart';
import 'package:rpg_d_d_flutter/View/item_lista.dart';
import 'package:rpg_d_d_flutter/View/login.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:rpg_d_d_flutter/View/menu.dart';
import 'package:rpg_d_d_flutter/View/personagem_lista.dart';
import 'package:rpg_d_d_flutter/View/usuario_cadastro.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

import 'View/personagem_cadastro.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await Sqlite.Sqflite.get();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => Login(),
        "/menuPrincipal": (context) => Menu(),
        "/usuarioCadastro": (context) => UsuarioCadastro(),
        "/salvarPersonagem": (context) => PersonagemCadastro(),
        "/itemCadastro": (context) => ItemCadastro(),
        "/itemLista": (context) => ListaItem(),
        "/habilidadeCadastro": (context) => HabilidadeCadastro(),
        "/habilidadeListagem": (context) => const ListaHabilidade(),
        "/personagemCadastro": (context) => PersonagemCadastro(),
        "/listaPersonagem": (context) => const ListaPersonagem(),
        "/dado": (context) => Dado(),
      },
      // const MyHomePage(title: 'Primeiro app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
