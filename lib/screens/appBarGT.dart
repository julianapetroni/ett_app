import 'package:flutter/material.dart';
import 'package:terceiros_app/domains/usuario.dart';
import 'package:terceiros_app/screens/alterarCadastro.dart';
import 'package:terceiros_app/screens/regrasEmissao.dart';
import 'package:terceiros_app/screens/termosDeUso.dart';
import 'login.dart';
import 'novaSenha.dart';

class AppBarPEC extends AppBar {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBarPEC({Key key, Widget title})
      : super(
    key: key,
    title: title,
    backgroundColor: Colors.grey[100],
    iconTheme: new IconThemeData(color: Colors.grey[600]),
  );
}

class MyDrawer extends Drawer {
  var cancelar = 'CANCELADO';

  Usuario user;
  Token token;

  MyDrawer({Key key, this.user, this.token})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 30.0, top: 40.0, bottom: 30.0),
              child: Text("Menu",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.grey[700],
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6)),
            ),
            new ListTile(
              title: new Text('Alterar Cadastro'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlterarCadastro(user: user, token: token)),
                );
              },
            ),
            new ListTile(
              title: new Text('Alterar Senha'),
              leading: Icon(Icons.lock),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NovaSenha(user: user)),
                );
              },
            ),
            new ListTile(
              title: new Text('Termos de Uso'),
              leading: Icon(Icons.folder),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TermosDeUso()),
                );
              },
            ),

            new ListTile(
              title: new Text(
                'Sair',
                style: TextStyle(color: Colors.red),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin()),
                );
              },
            ),

            // teste

          ],
        ),
      ),
    );
  }
}