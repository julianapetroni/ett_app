import 'dart:ui';

import 'package:ett_app/screens/comunicadoInterno.dart';
import 'package:ett_app/screens/consultarAlteracaoEscala.dart';
import 'package:ett_app/screens/testeTable.dart';
import 'package:flutter/material.dart';
import 'package:ett_app/domains/Usuario.dart';
import 'package:ett_app/screens/alterarCadastro.dart';
import 'package:ett_app/screens/termosDeUso.dart';
import 'ConsultarAlteracaoEscalaTeste.dart';
import 'comunicadoInternoGrupo.dart';
import 'dadosCadastro.dart';
import 'enviarAlteracaoEscala.dart';
import 'login.dart';
import 'novaSenha.dart';

class AppBarPEC extends AppBar {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBarPEC({Key key, Widget title})
      : super(
    key: key,
    title: title,
    backgroundColor: Colors.yellow[800],
    iconTheme: new IconThemeData(color: Colors.grey[600]),
  );
}

class MyDrawer extends Drawer {

  var cancelar = 'CANCELADO';

  Usuario user;

  MyDrawer({Key key, this.user})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {

    _color(){
      Colors.grey[700];
    };

    _colorChange(){
      setState() {
        Colors.yellow[800];
      }
    };

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

            new ExpansionTile(
              title: new Text('Cadastros', style: TextStyle(color: Colors.grey[700], fontSize: 17.0),),
              leading: Icon(Icons.settings, color: Colors.grey[700],),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 10.0,),

                      ListTile(
                        leading: Icon(Icons.group, color: _color()),
                        title: Text('Grupos',
                          style: TextStyle(fontWeight: FontWeight.normal, color: _color(), fontSize: 16.0),),
                        onTap: (){
                          _colorChange();
                        },
                      ),
                      SizedBox(height: 15.0,),
                      ListTile(
                        leading: Icon(Icons.person_add, color: Colors.grey[700]),
                        title: Text('Usuários',
                          style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                        onTap: (){

                        },
                      ),

                      SizedBox(height: 15.0,)

                    ],
                  ),
                )
              ],
            ),
            new ExpansionTile(
              title: new Text('Formulários', style: TextStyle(color: Colors.grey[700], fontSize: 17.0)),
              leading: Icon(Icons.insert_drive_file, color: Colors.grey[700]),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new Column(
                    children: <Widget>[
                      new ExpansionTile(
                          title: Row(
                            children: <Widget>[
                              Icon(Icons.comment, color: Colors.grey[700]),
                              SizedBox(width: 10.0,),
                              Text('Comunicado Interno', style: TextStyle(color: Colors.grey[700], fontSize: 16.0),),
                            ],
                          ),
                        children: <Widget>[
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.send, color: Colors.grey[700]),
                            ),
                            title: Text('Enviar',
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComunicadoInterno()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.assignment_ind, color: Colors.grey[700]),
                            ),
                            title: Text('Meus relatórios',
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => MyApp()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.assignment, color: Colors.grey[700]),
                            ),
                            title: Text('Todos Relatórios',
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ComunicadoInternoGrupo()),
                              );
                            },
                          ),

                          SizedBox(height: 20.0,),
                        ],
                      ),

//                      SizedBox(height: 5.0,),
                      new ExpansionTile(
                        title: Row(
                          children: <Widget>[
                            Icon(Icons.edit, color: Colors.grey[700]),
                            SizedBox(width: 10.0,),
                            Text('Alteração de Escala', style: TextStyle(color: Colors.grey[700], fontSize: 16.0),),
                          ],
                        ),
                        children: <Widget>[
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.send, color: Colors.grey[700]),
                            ),
                            title: Text('Enviar',
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EnviarAlteracaoEscala()),
                              );
                            },
                          ),
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.search, color: Colors.grey[700]),
                            ),
                            title: Text('Consultar',
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ConsultarAlteracaoEscala()),
                              );
                            },
                          ),

                          SizedBox(height: 20.0,),

                          //Teste
                          ListTile(
                            leading: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Icon(Icons.search, color: Colors.grey[700]),
                            ),
                            title: Text('Consultar com filtro - Teste',
                              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700], fontSize: 16.0),),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ConsultarAlteracaoEscalaTeste()),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],

            ),

            new ListTile(
              title: new Text(
                'Sair',
                style: TextStyle(color: Colors.red[700], fontSize: 17.0),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red[700],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}