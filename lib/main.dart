import 'package:flutter/material.dart';

void main() => runApp(
  BytebankApp()
);

//Classe principal
class BytebankApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaTranferencias(),
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
            ItemTranferencia(Transferencia('Juliana', 500.0)),
            ItemTranferencia(Transferencia('Carlos', 10000.00)),
            ItemTranferencia(Transferencia( 'Juliana', 3000.00)),
          ]
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context){return FormularioTransferencia();}
          ));
        },

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

//Formulario de tranferencia
class FormularioTransferencia extends StatelessWidget{

  //Variaveis que serão inseridas pelo usuario
  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Criando Tranferência"),),
      body: Column(
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controladorCampoConta,
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
              controller: _controladorCampoValor,
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
            child: Text("Confirmar"),
            onPressed: (){
              debugPrint(_controladorCampoValor.text+_controladorCampoConta.text);

              final String conta = _controladorCampoConta.text.toString();
              final double valor = double.tryParse(_controladorCampoValor.text);

              if(conta!= null && valor != null ){
                final tranferenciaCriada = Transferencia(conta, valor);
                debugPrint('$tranferenciaCriada');
              }
            },
          ),
        ],
      ),
    );
  }
}

class Transferencia {

  final String conta;
  final double valor;


  Transferencia(this.conta, this.valor);

  @override
  String toString(){
    return 'Tranferencia{Conta: $conta, Valor: $valor }';
  }

}