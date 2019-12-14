import 'package:bytebank/screens/lista_tranferencia.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    MyApp()
);

//Classe principal
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(
      ),
      home: ListaTranferencias(),
    );
  }
}

