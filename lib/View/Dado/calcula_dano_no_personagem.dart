import 'package:flutter/material.dart';
import 'package:rpg_d_d_flutter/Domain/Personagem.dart';
import 'package:rpg_d_d_flutter/Domain/Usuario.dart';
import 'package:rpg_d_d_flutter/Model/sqflite/Sqlite.dart';
class calculaDano {

  static void  calcularVida(Personagem personagem, List<int> dados) {
    double valor = 0.0;
    dados.forEach((element) {
      valor = valor + element;
    });
    String mediaString = (valor/dados.length).toString();
    var lista = mediaString.split('.');
    int media = int.parse(lista[0]);
    personagem.vida = personagem.vida - media;
    Sqflite.salvarPersonagem(personagem.nome, personagem.nivel, personagem.vida as int, 1, personagem.id);
  }

  void calcularAtaque(double ataque, List<int> dados) {
    //TODO implementar ataque no personagem
  }
}