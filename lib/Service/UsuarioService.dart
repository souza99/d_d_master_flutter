

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg_d_d_flutter/Domain/Usuario.dart';
import '../Model/sqflite/Sqlite.dart' as Sqlite;

class UsuarioService {


  // Future creatUsuario({required Usuario usuario}) async {
  //   //Referencia ao documento
  //   final docUser =FirebaseFirestore.instance.collection('usuarios').doc('my-id');
  // }

  final json = {
    // 'nome' : usuario.nome
  };

  Future<bool> validarLogin({required String email, required String senha}) async {
    try {
      Usuario? usuario = await Sqlite.Sqflite.getUsuarioByEmail(email);
      if (usuario?.senha == senha) {
        return true;
      } else {
        return false;
      }
    } catch(e) {
      return false;
    }

  }
}
