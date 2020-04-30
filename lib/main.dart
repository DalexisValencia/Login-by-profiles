import 'package:flutter/material.dart';
import 'package:fourth_test_app/pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        //primarySwatch: Color(0xFFffffff),
        primaryColor: Color(0xFF50576F),
        primaryColorDark:Color(0xFF282F47),//azul oscuro
        primaryColorLight: Color(0xFF7484B0),// azul claro
        textSelectionColor: Color(0xFFffffff),// blanco
        hoverColor: Color(0xFFE64D61),// Rojo
        accentColor: Color(0xFFF57B34),// Naranja
      ),
      home: SignUpScaffold()
    );
  }
}
