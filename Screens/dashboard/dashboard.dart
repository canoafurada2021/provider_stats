import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/saldo.dart';
import 'deposito/formulario.dart';
import 'saldo.dart';

class Dashboard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Bytebank'),
        ),
        body: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: SaldoCard(),
              ),
               ElevatedButton(
                  child: Text('Receber depósito'),
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context){
                    return FormularioDeposito();

                    },
                    )
                    );
                  },
              )
            ]));
  }
}