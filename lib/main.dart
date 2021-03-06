import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:terceiros_app/screens/agendarData.dart';
import 'package:terceiros_app/screens/fotosDosDocs.dart';
import 'package:terceiros_app/screens/iniciarSolicitacao.dart';
import 'package:terceiros_app/screens/login.dart';
import 'package:terceiros_app/screens/novaSenha.dart';
import 'package:terceiros_app/screens/selecionarInstituicao.dart';
import 'package:terceiros_app/screens/status.dart';
import 'package:terceiros_app/screens/termosDeUso.dart';
import 'package:terceiros_app/screens/dadosCadastro.dart';
import 'package:terceiros_app/screens/docsNecessarios.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//“lock” the device orientation and not allow it to change as the user rotates their phone
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate
    ], supportedLocales: [
      const Locale('pt', 'BR')
    ], home: MainApp()));
  });
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
//      routes: {
//        //telas
//        '/agendarData': (context) => AgendarData(), //agendarData.dart
//
//        '/dadosCadastro': (context) => DadosCadastro(), // dadosCadastro.dart
//        '/documentos': (context) => Documentos(), //documentosNecessarios.dart
//        //orientacoesFotosDocs.dart
//        '/iniciarSolicitacao': (context) =>
//            IniciarSolicitacao(), //iniciarSolicitacao.dart
//        '/login': (context) => TelaLogin(), //login.dart
//        '/novaSenha': (context) => NovaSenha(), //novaSenha.dart
//        '/termosDeUso': (context) => TermosDeUso(), //termosDeUso.dart
//        '/tirarFotosDocs': (context) => TirarFotosDocs(), //fotosDosDocs.dart
//        '/status': (context) => Status(), //status.dart
//        '/statusFinal': (context) => StatusFinal(), //status.dart
//
//        //'/selecionarInstituicao': (context) => SelecionarInstituicao(),
//      },
    );
  }
}
