import 'package:flutter/material.dart';

void main() => runApp(
  BytebankApp()
);

class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}



class ListaTranferencias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tranferências'),),
      body: Column(
          children: <Widget>[
            ItemTranferencia(Transferencia(500.00, 'Juliana')),
            ItemTranferencia(Transferencia(10000.00, 'Carlos')),
            ItemTranferencia(Transferencia(3000.00, 'Juliana')),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
      ),
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

class FormularioTransferencia extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Criando Tranferência"),),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 24.0,),
              decoration: InputDecoration(
                icon: Icon(Icons.account_box),
                labelText: 'Número da conta',
                hintText: 'XXXX-X',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 24.0,),
              decoration: InputDecoration(
                icon: Icon(Icons.monetization_on),
                labelText: 'Valor',
                hintText: 'R\$00,00',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          RaisedButton(
            child: Text("confirmar"),
            onPressed: ,
          ),
        ],
      ),
    );
  }
}

class Transferencia {

  final String conta;
  final double valor;


  Transferencia(this.valor, this.conta);

}