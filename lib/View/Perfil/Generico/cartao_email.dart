import 'package:flutter/material.dart';
import 'package:rpg_d_d_flutter/View/Perfil/Generico/painel_email.dart';
import 'package:url_launcher/url_launcher.dart';

class CartaoEmail extends StatelessWidget {
  const CartaoEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: const Text('Email: '),
        subtitle: const Text('jpfsouza99@gmail.com'),
        trailing: PainelEmail(
          funcaoEmail: mandarEmail,
        ),
      ),
    );
  }

  mandarEmail() {
    launchUrl(Uri(scheme: 'mailto', path: 'nome@gmail.com'));
  }
}
