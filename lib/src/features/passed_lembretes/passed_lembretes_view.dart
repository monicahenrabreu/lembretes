import 'package:flutter/material.dart';

class PassedLembretesView extends StatefulWidget {
  const PassedLembretesView({Key? key}) : super(key: key);

  static String id = 'passed_lembretes';

  @override
  State<PassedLembretesView> createState() => _PassedLembretesViewState();
}

class _PassedLembretesViewState extends State<PassedLembretesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: const Center(
              child: Text('Lembretes passados',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xff544646),
                  )))),
    );
  }
}
