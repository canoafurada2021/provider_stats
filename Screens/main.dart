import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dashboard/dashboard.dart';
import 'models/saldo.dart';
import 'transferencia/lista.dart';

void main() => runApp(ChangeNotifierProvider(
      create: (context) => Saldo(0),
      child: const ByteBankApp(),
    ));

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
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: Dashboard(),
    );
  }
}
