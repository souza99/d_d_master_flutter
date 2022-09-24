import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:rpg_d_d_flutter/Domain/Habilidade.dart';
import 'package:sqflite/sqflite.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

class ListaHabilidade extends StatefulWidget {
  const ListaHabilidade({Key? key}) : super(key: key);

  @override
  _ListaHabilidadeState createState() => _ListaHabilidadeState();
}

class _ListaHabilidadeState extends State<ListaHabilidade> {
  var key = const ListaHabilidade().key;

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
                  Sqlite.Sqflite.deletarHabilidade(id);
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
          title: const Text("Lista de Habilidades"),
          backgroundColor: Colors.green,

          //Define as ações que podem ser realizadas na appbar
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => Navigator.pushNamed(
                      context, '/habilidadeCadastro',
                      arguments: null)
                  .then((value) {
                setState(() {});
              }),
            )
          ],
        ),
        body: FutureBuilder(
          //busca os dados das habilidades => buscarHabilidade()
          key: key,
          future: Sqlite.Sqflite.buscarHabilidades(),

          builder: (context,
              AsyncSnapshot<List<Map<String, Object?>>?> dadosFuturos) {
            //Caso a consulta ainda não tenha retornado os dados vai ser mostrado
            // o spinner de carregando
            if (!dadosFuturos.hasData) {
              return const CircularProgressIndicator();
            }
            var listaHabilidade = dadosFuturos.data!;
            return ListView.builder(
              itemCount: listaHabilidade.length,
              itemBuilder: (context, contador) {
                var habilidade = listaHabilidade[contador];
                return ListTile(
                  title: Text(habilidade['nome'].toString()),
                  subtitle: Text(habilidade['descricao'].toString()),
                  trailing: Container(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          color: Colors.amber,
                          onPressed: () => Navigator.pushNamed(
                                  context, '/habilidadeCadastro',
                                  arguments: habilidade)
                              .then((value) =>
                            setState(() {})
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          color: Colors.red,
                          onPressed: () => mostrarDialog(
                              context, int.parse(habilidade['id'].toString())),
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
