import 'package:flutter/material.dart';
import 'package:lembretes/lembretes_app.dart';
import 'package:lembretes/provider/lembretes_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => LembretesProvider(),
      ),
    ],
    child: const LembretesApp()),
  );
}
