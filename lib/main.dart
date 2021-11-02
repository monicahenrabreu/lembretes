import 'package:flutter/material.dart';
import 'package:lembretes/src/provider/lembretes_provider.dart';
import 'package:provider/provider.dart';
import 'src/lembretes_app.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LembretesProvider(),
      ),
    ],
    child: const LembretesApp(),
  ));
}
