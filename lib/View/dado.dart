import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rpg_d_d_flutter/Domain/Personagem.dart';
import 'package:rpg_d_d_flutter/View/Dado/calcula_dano_no_personagem.dart';
import 'Dado/gera_valor.dart' as gareValorDado;
import '../View/Dado/calcula_dano_no_personagem.dart' as calcularDano;

class Dado extends StatefulWidget {
  const Dado({Key? key}) : super(key: key);

  @override
  _DadoState createState() => _DadoState();
}

class _DadoState extends State<Dado> {
  var key = const Dado().key;

  int? tamanhoDado;
  int? quantidadeDados;
  List<int> resultadoDados = [];
  bool _mostrandoResultado = false;

  late int? id = null;
  late String nome = '';
  late int nivel = 0;
  late int vida = 0;
  late int classe_id = 1;
  late Personagem personagem = Personagem();

  void mostrarListaDados() {
    setState(() {
      _mostrandoResultado = !_mostrandoResultado;
    });
  }

  @override
  Widget build(BuildContext context) {

    var argumento = ModalRoute.of(context)?.settings.arguments;

    if (argumento != null) {
      Map<String, Object?> personagem = argumento as Map<String, Object?>;
      this.personagem.id = personagem['id'] as int;
      this.personagem.nome = personagem['nome'] as String;
      this.personagem.nivel = personagem['nivel'] as int;
      this.personagem.vida = personagem['vida'] as int;
      this.personagem.classe_id = personagem['classe_id'] as int;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Dados"),
          leading: IconButton(
            icon: const Icon(MdiIcons.dice3),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => tamanhoDado = int.tryParse(value),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    labelText: 'Tamanho do dado',
                    hintText:
                        'Digite o tamanho total do dado que deseja jogar.',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    prefixIcon: const Icon(
                      MdiIcons.dice6,
                      color: Colors.black,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => quantidadeDados = int.tryParse(value),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0.0),
                    labelText: 'Quantidade de dados',
                    hintText:
                    'Digite a quantidade de dados.',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14.0,
                    ),
                    prefixIcon: const Icon(
                      MdiIcons.dice1,
                      color: Colors.black,
                      size: 18,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(color: Colors.grey.shade200, width: 2),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    floatingLabelStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                      const BorderSide(color: Colors.black, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(30),
                        child: Icon(MdiIcons.dice2)),
                    MaterialButton(
                      onPressed: () {
                        this.resultadoDados =
                            gareValorDado.GeraValor.gareValorDado(
                                tamanhoDado!, quantidadeDados!) as List<int>;
                        mostrarListaDados();
                      },
                      height: 45,
                      color: Colors.black,
                      child: const Text(
                        "Lançar",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.all(30),
                        child: Icon(MdiIcons.dice4))
                  ],
                ),
                const Padding(
                    padding: EdgeInsets.all(5), child: Icon(MdiIcons.dice5)),
                const SizedBox(
                  height: 30,
                ),
                Visibility(
                    visible: _mostrandoResultado,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          color: Colors.grey,
                          height: 200.0,
                          width: 300.0,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: resultadoDados.length,
                            itemBuilder: (BuildContext context, int index) {
                              calcularDano.calculaDano.calcularVida(personagem, resultadoDados);
                              return ListTile(
                                title: Card(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      'Dado ${index + 1}, resultado: ${resultadoDados[index] + 1}'),
                                )),
                              );
                            },
                          ),

                        )
                      ],
                    )),
              ],
            ),
          ),
        ));
  }
}
