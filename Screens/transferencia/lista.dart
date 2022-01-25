import 'package:flutter/material.dart';

import '../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = "Transferências";

void main() => runApp(const ByteBankApp());

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey,
        ).copyWith(
          secondary: Colors.blueGrey[200],
        ),
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueGrey[200],
            textTheme: ButtonTextTheme.primary),
      ),
      home: ListaTransferencias(),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (
          context,
          indice,
        ) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia: transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final transferenciaRecebida = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const FormularioTransferencia();
                },
              ),
            ) as Transferencia;

            debugPrint("chegou no then do future");
            debugPrint("$transferenciaRecebida");

            _atualiza(transferenciaRecebida);
          }),
    );
  }

  Future _atualiza(Transferencia transferenciaRecebida) async {
    setState(() {
      widget._transferencias.add(transferenciaRecebida);
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  const ItemTransferencia({
    Key? key,
    required this.transferencia,
  }) : super(key: key);

  final Transferencia transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(
          transferencia.valor.toString(),
        ),
        subtitle: Text(
          transferencia.numeroConta.toString(),
        ),
      ),
    );
  }
}
