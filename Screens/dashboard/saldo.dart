import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/saldo.dart';

class SaldoCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Consumer<Saldo>(
              builder: (context, valor, child) {
                return Text(valor.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            )));
  }
}
