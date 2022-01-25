import 'package:flutter/material.dart';


import '../../components/editor.dart';
const _titulosAppBar = 'receber depósito';
const _CampoValor = '0.00';
const _rCampoValor = 'Valor';
const _textoBotaoConfirmar = 'Confirmar';


class FormularioDeposito extends StatelessWidget {
  final TextEditingController _controladorCampoValor = TextEditingController();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text(_titulosAppBar),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Editor(
                dica: _rCampoValor,
                controlador: _controladorCampoValor,
                rotulo: _CampoValor,
                icone: Icons.monetization_on,
              ),
              ElevatedButton(
                child: const Text(_textoBotaoConfirmar),
                onPressed: () => _criaDeposito(context),
              ),
            ],
          ),
        ));
  }

  _criaDeposito(context) {
    Navigator.pop(context);
  }

}

