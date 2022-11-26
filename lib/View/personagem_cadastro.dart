import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rpg_d_d_flutter/Domain/Habilidade.dart';
import 'package:rpg_d_d_flutter/Domain/Item.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

import '../Domain/Classe.dart';

late List<Habilidade> habilidades = [];
late Habilidade habilidadeSelecionada = Habilidade();

class DropdownButtonHabilidade extends StatefulWidget {
  const DropdownButtonHabilidade({Key? key}) : super(key: key);

  @override
  State<DropdownButtonHabilidade> createState() =>
      _DropdownButtonHabilidadeState();
}

class _DropdownButtonHabilidadeState extends State<DropdownButtonHabilidade> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<Habilidade>(
      value: habilidadeSelecionada,
      onChanged: (Habilidade? value) {
        setState(() {
          habilidadeSelecionada = value!;
        });
      },
      items: habilidades.map<DropdownMenuItem<Habilidade>>((Habilidade value) {
        return DropdownMenuItem<Habilidade>(
          value: value,
          child: Text(value.nome),
        );
      }).toList(),
    );
  }
}

class PersonagemCadastro extends StatefulWidget {
  PersonagemCadastro({Key? key}) : super(key: key);

  @override
  State<PersonagemCadastro> createState() => _PersonagemCadastroState();
}

class _PersonagemCadastroState extends State<PersonagemCadastro> {
  late int? id = null;

  late String nome = '';

  late int nivel = 0;

  late int vida = 0;

  //late List<Item> iventario;
  late int classe_id = 1;

  late Habilidade? habilidade;

  Future<List<Habilidade>?> retornaHabilidades() async {
    await Sqlite.Sqflite.buscarHabilidades().then((habilidadesNaoFormatadas) {
      List<Map<String, Object?>>? habilidadesMap = habilidadesNaoFormatadas;
      habilidadesNaoFormatadas?.forEach((habilidade) {
        Habilidade habilidadeCerta = Habilidade();

        habilidadeCerta.id = habilidade['id'] as int;
        habilidadeCerta.nome = habilidade['nome'] as String;
        habilidadeCerta.porcentagem = habilidade['porcentagem'] as double;
        habilidadeCerta.descricao = habilidade['descricao'] as String;
        habilidadeCerta.tipo = habilidade['tipo'] as String;

        habilidades.add(habilidadeCerta);
      });
    });
    habilidadeSelecionada = habilidades.first;
    return habilidades;
  }

  //<String>['One', 'Two', 'Three', 'Four'];
  @override
  Widget build(BuildContext context) {
    habilidades = [];
    var argumento = ModalRoute.of(context)?.settings.arguments;
    if (argumento != null) {
      Map<String, Object?> personagem = argumento as Map<String, Object?>;
      id = personagem['id'] as int;
      nome = personagem['nome'] as String;
      nivel = personagem['nivel'] as int;
      vida = personagem['vida'] as int;
      classe_id = personagem['classe_id'] as int;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cadastro de Personagem",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => nome = value,
                  keyboardType: TextInputType.text,
                  initialValue: nome,
                  decoration: const InputDecoration(
                    label: Text("Nome:"),
                    hintText: "Ex: Cavaleiro de Dragão fenHur",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => nivel = int.tryParse(value)!,
                  keyboardType: TextInputType.number,
                  initialValue: nivel.toString(),
                  decoration: const InputDecoration(
                    label: Text("Nivel: "),
                    hintText: "Ex: 18",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  onChanged: (value) => vida = int.tryParse(value)!,
                  keyboardType: TextInputType.number,
                  initialValue: vida.toString(),
                  decoration: const InputDecoration(
                    label: Text("Vida:"),
                    hintText: "Ex: 200",
                  ),
                ),
              ),
              FutureBuilder(
                future: retornaHabilidades(),
                key: PersonagemCadastro().key,
                builder:
                    (context, AsyncSnapshot<List<Habilidade>?> dadosFuturos) {
                  if (!dadosFuturos.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Padding(
                        padding: EdgeInsets.all(15),
                        child: DropdownButtonHabilidade());
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  child: const Text("Salvar"),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    habilidades = [];
                    Sqlite.Sqflite.salvarPersonagem(
                        nome, nivel, vida, classe_id, id);
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
