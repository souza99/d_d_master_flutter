import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:path/path.dart';
import 'package:rpg_d_d_flutter/Domain/Personagem.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

class ListaPersonagem extends StatefulWidget {
  const ListaPersonagem({Key? key}) : super(key: key);

  @override
  _ListaPersonagemState createState() => _ListaPersonagemState();
}

class _ListaPersonagemState extends State<ListaPersonagem> {
  var key = const ListaPersonagem().key;

  mostrarDialog(BuildContext context, int id) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Deseja excluir o registro ?"),
            actions: [
              ElevatedButton(
                child: const Text("Sim"),
                onPressed: () {
                  Sqlite.Sqflite.deletarPersonagem(id);
                  Navigator.pop(context);
                  setState(() {});
                },
              ),
              ElevatedButton(
                child: const Text("Não"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Lista de Personagens"),
          backgroundColor: Colors.green,

          //Define as ações que podem ser realizadas na appbar
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(
                      context, '/personagemCadastro',
                      arguments: null)
                  .then((value) {
                setState(() {});
              }),
            )
          ],
        ),
        body: FutureBuilder(
          //busca os dados das personagens => buscarPersonagem()
          key: key,
          future: Sqlite.Sqflite.buscarPersonagens(),

          builder: (context,
              AsyncSnapshot<List<Map<String, Object?>>?> dadosFuturos) {
            //Caso a consulta ainda não tenha retornado os dados vai ser mostrado
            // o spinner de carregando
            if (!dadosFuturos.hasData) {
              return const CircularProgressIndicator();
            }
            var listaPersonagem = dadosFuturos.data!;
            return ListView.builder(
              itemCount: listaPersonagem.length,
              itemBuilder: (context, contador) {
                var personagem = listaPersonagem[contador];
                return ListTile(
                  title: Text(personagem['nome'].toString()),
                  subtitle: Text(personagem['vida'].toString()),
                  trailing: Container(
                    width: 145,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(MdiIcons.heart),
                          color: Colors.green,
                          onPressed: () {
                            Navigator.pushNamed(
                              context, '/dado',
                              arguments: personagem)
                              .then((value) {
                            setState(() {});
                          });

                          }
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.amber,
                          onPressed: () => Navigator.pushNamed(
                                  context, '/personagemCadastro',
                                  arguments: personagem)
                              .then((value) {
                            setState(() {});
                          }),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => mostrarDialog(
                              context, int.parse(personagem['id'].toString())),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
