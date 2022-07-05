import 'package:flutter/cupertino.dart';

import '../Data/dummy_users.dart';

class Usuario with ChangeNotifier {
  final Map<String, Usuario> _usuarios = {...DUMMY_USUARIOS};

  List<Usuario> get all {
    return [..._usuarios.values];
  }
}
