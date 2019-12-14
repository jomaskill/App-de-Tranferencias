import 'package:bytebank/components/editor.dart';
import 'package:flutter/material.dart';

////////////////////////////Tela de Formulario de tranferencia STATEFUL//////////////////
class FormularioTransferencia extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return FormularioTranferenciaState();
  }
}


class FormularioTranferenciaState extends State<FormularioTransferencia>{

  //Variaveis que serão inseridas pelo usuario
  final TextEditingController _controladorCampoConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Adicionando devedores"),),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor( //Campo que representa a conta
                controlador: _controladorCampoConta,
                rotulo: 'Nome da Pessoa',
                dica: 'Provavelmente é o Hiagor'
            ),
            Editor( // Campo que representa o valor
                controlador: _controladorCampoValor,
                rotulo: 'Valor',
                dica: '00.00',
                icone: Icons.monetization_on
            ),
            RaisedButton(
              child: Text("Confirmar"),
              onPressed: (){
                _criarTranferencia(context);
              },
            ),
          ],
        ),
      ),
    );
  }

///////////////
  void _criarTranferencia(BuildContext context) {
    final String conta = _controladorCampoConta.text.toString();
    final double valor = double.tryParse(_controladorCampoValor.text);
    if(conta!= null && valor != null ){
      final tranferenciaCriada = Transferencia(conta, valor);
      Navigator.pop(context, tranferenciaCriada);
    }
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