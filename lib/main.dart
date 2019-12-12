import 'package:flutter/material.dart';

void main() => runApp(
   MaterialApp(
     home: Scaffold(
       body: ListaTranferencias(),
       appBar: AppBar(title: Text('Tranferências'),),
       floatingActionButton: FloatingActionButton(
           child: Icon(Icons.add),
         ),
     ),
   )
);


class ListaTranferencias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          ItemTranferencia(Transferencia(500.00, 'Juliana')),
          ItemTranferencia(Transferencia(2000.00, 'Carlos')),
          ItemTranferencia(Transferencia(3000.00, 'Juliana')),
        ]
    );
  }
}

class ItemTranferencia extends StatelessWidget{

  final Transferencia _transferencia;


  ItemTranferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.conta.toString()),
        subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}

class Transferencia {

  final String conta;
  final double valor;


  Transferencia(this.valor, this.conta);

}