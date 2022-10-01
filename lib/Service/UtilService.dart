import 'package:flutter/material.dart';

class UtilService {
  void mostarNotificacao({ required BuildContext context, required String mensagem}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(mensagem),
        action: SnackBarAction(label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}