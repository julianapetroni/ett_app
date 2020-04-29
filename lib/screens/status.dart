import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ett_app/domains/Agendamento.dart';
import 'package:ett_app/domains/DataAgendamento.dart';
import 'package:ett_app/domains/HoraAgendamento.dart';
import 'package:ett_app/domains/Usuario.dart';
import 'package:ett_app/domains/solicitacao.dart';
import 'appBar.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'login.dart';

class Status extends StatefulWidget {

  Usuario user;
  Token token;
  //HoraAgendamento ha;
  final String text;
  final String cancelar; // cancelar agendamento
  //final String value; // instituição de ensino
  Solicitacao sol;

  Status({Key key, this.user, this.token, @required this.text, this.sol, this.cancelar})
      : assert(user.id != null),
        super(key: key);

  @override
  StatusState createState() {
    return StatusState(user: user, sol: sol, token: token);
  }
}

class StatusState extends State<Status> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

//  String _textoData = ' ';
  String _textoHora = '';
  //data e hora cond 3

  Token token;
  Usuario user;
  Solicitacao sol;
  StatusState({this.user, this.sol, this.token});
  var botaoValue = '';
  int cond;
  String diaHora = '--T';
  String dataProducaoCartao = '--T';
  String dataParaRetirada = '--T';
  String dataEntregaCartao = '--T';
  String dataDaEntrevista = '--T';
  String _textoData = '--T';
  String statusSolicitacao;
  String motivoRejeicao;

  @override
  void initState() {
    super.initState();
    _makeGetRequest();
//    _makeHoraDataRequest();
  }



  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future _makeGetRequest() async{

    String url = //'https://www.accio.com.br:447/api/v1/solicitacoes/cliente/' + user.id.toString() + '/status/ATIVO';

    'https://www.accio.com.br:447/api/v1/solicitacoes/cliente/' + user.id.toString() + '/solicitacao/andamento';
    await http
        .get(url,
        headers: {
          'Authorization':
          'bearer d16e3966-eb87-4337-bfee-bee54b5a4052'
        })
        .then((http.Response res) {
      print("Response statuss: ${res.statusCode}");
      //print(res.headers);
      print(user.email);
      print(user.id);

    });
  }


  @override
  Widget build(BuildContext context) {
    double a_width = MediaQuery.of(context).size.width*0.4;
    double b_width = MediaQuery.of(context).size.width*0.3;
    double title_width = MediaQuery.of(context).size.width*0.7;
    double title_height = MediaQuery.of(context).size.height*0.2;
    print(cond);
    Widget _dataAgendamento() {
      if (cond == 0) {
        print('cond = 0');
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else if(cond != 0){
        var texto3 = '';
        var texto = diaHora;
        var texto1 = texto.split("T");
        var texto2 = texto1[0].split("-");
        texto3 = texto2[2].toString() + "/" + texto2[1].toString() + "/" + texto2[0].toString();

        return Column(
          children: <Widget>[
            Text(
              texto3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxAgendamento() {
      if (cond == 0) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataEntrevista() {
      if (cond == 0 || cond == 1 || cond == 2) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        var textoDtAg3 = '';
        var textoDtAg = _textoData;
        var textoDtAg1 = textoDtAg.split("T");
        var textoDtAg2 = textoDtAg1[0].split("-");
        textoDtAg3 =
            textoDtAg2[2].toString() + "/" + textoDtAg2[1].toString() + "/" +
                textoDtAg2[0].toString();

        return Column(
          children: <Widget>[

            Text(
              textoDtAg3,
//                sol.dataAgendamento,
//                _textoData,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            Text(
//                sol.horarioReservado,
              _textoHora,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),

          ],
        );
      }



    }

    Widget _checkBoxEntrevista() {
      if (cond == 0 || cond == 1 || cond == 2) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataProducaoCartao() {
      if (dataProducaoCartao == null) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        //_makeHoraDataRequest();
        var textoProd3 = '';
        var textoProd = dataProducaoCartao;
        var textoProd1 = textoProd.split("T");
        var textoProd2 = textoProd1[0].split("-");
        textoProd3 = textoProd2[2].toString() + "/" + textoProd2[1].toString() + "/" + textoProd2[0].toString();

        return Column(
          children: <Widget>[
            Text(
//        sol.dataProducaoCartao,
              textoProd3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxdataProducaoCartao() {
      if (dataProducaoCartao == null) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataParaRetirada() {
      if (dataParaRetirada == null) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        var textoRet3 = '';
        var textoRet = dataParaRetirada;
        var textoRet1 = textoRet.split("T");
        var textoRet2 = textoRet1[0].split("-");
        textoRet3 = textoRet2[2].toString() + "/" + textoRet2[1].toString() + "/" + textoRet2[0].toString();

        //_makeHoraDataRequest();
        return Column(
          children: <Widget>[
            Text(
              //_textoDataParaRetirada,
//              sol.dataParaRetirada,
              textoRet3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxdataParaRetirada() {
      if (dataParaRetirada == null) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataEntregaCartao() {
      if (dataEntregaCartao == null) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        var textoEntr3 = '';
        var textoEntr = dataEntregaCartao;
        var textoEntr1 = textoEntr.split("T");
        var textoEntr2 = textoEntr1[0].split("-");
        textoEntr3 = textoEntr2[2].toString() + "/" + textoEntr2[1].toString() + "/" + textoEntr2[0].toString();

        //_makeHoraDataRequest();
        return Column(
          children: <Widget>[
            Text(
              //_textoDataEntregaCartao,
//              sol.dataEntregaCartao,
              textoEntr3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxdataEntregaCartao() {
      if (dataEntregaCartao == null) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }



    Widget _cancelar() {
      if (widget.cancelar == null) {
        return Text(' ');
      } else {
        return Column(
          children: <Widget>[
            Text(
              widget.cancelar,
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ],
        );
      }
    }



    Future<Null> _refresh() {
      return _makeGetRequest().
      then((Solicitacao) {
        setState(() =>  sol = sol);
      });
    }

    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

    bool _isVisible = true;
    bool _motivoRejeicao = false;


    if( statusSolicitacao == 'NEGADA') {
      _isVisible = false;
      _motivoRejeicao = true;

    }

    return Scaffold(
        appBar: AppBarPEC(
          title: Row(
            children: <Widget>[
              Spacer(flex: 2),
              Container(
                  height: 45.0,
                  child: Image(image: AssetImage('images/ETT.png'))),
              Spacer(flex: 2),
              Container(child: Icon(Icons.person),),
              SizedBox(width: 5.0,)
            ],
          ),
        ),
        drawer: MyDrawer(user: user),
        backgroundColor: Colors.white,
        body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: Column(
                children: <Widget>[

                  Flexible(
                      flex: 4,
                      child: Container(
                          alignment: Alignment.topCenter,
                          child: ListView(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            children: <Widget>[



                            ],
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}