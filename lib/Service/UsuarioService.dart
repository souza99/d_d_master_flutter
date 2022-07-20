

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rpg_d_d_flutter/Domain/Usuario.dart';

class UsuarioService {


  Future creatUsuario({required Usuario usuario}) async {
    //Referencia ao documento
    final docUser =FirebaseFirestore.instance.collection('usuarios').doc('my-id');
  }

  final json = {
    // 'nome' : usuario.nome
  };
}
