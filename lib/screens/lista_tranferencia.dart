import 'package:flutter/material.dart';

import 'formulario_tranferencia.dart';


/////////////////////Tela principal STATEFUL, onde a tela é atualizada dinamicamente ////
class ListaTranferencias extends StatefulWidget {

  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciasState();
  }
}


class ListaTranferenciasState extends State<ListaTranferencias>{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Quem me deve'),),

      body: ListView.builder(// montando lista dinamica de itens
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice){

          final tranferencia = widget._transferencias[indice];
          return ItemTranferencia(tranferencia);

        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(
              builder: (context){return FormularioTransferencia();}
          ));
          future.then((tranferenciaRecebida){
            if(tranferenciaRecebida != null) {
              setState(() {
                widget._transferencias.add(tranferenciaRecebida);
              });
            }
          });
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
        leading: Icon(Icons.people_outline),
        title: Text(_transferencia.conta.toString()),
        subtitle: Text(_transferencia.valor.toString()),
      ),
    );
  }
}
/////////////////////////////////////////////////////////////////////////////////////////