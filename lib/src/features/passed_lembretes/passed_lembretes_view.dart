import 'package:flutter/material.dart';
import 'package:lembretes/src/widgets/lembrete_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:lembretes/src/models/lembrete_model.dart';
import 'package:lembretes/src/provider/lembretes_provider.dart';

class PassedLembretesView extends StatefulWidget {
  const PassedLembretesView({Key? key}) : super(key: key);

  static String id = 'passed_lembretes';

  @override
  State<PassedLembretesView> createState() => _PassedLembretesViewState();
}

class _PassedLembretesViewState extends State<PassedLembretesView> {
  late List<LembreteModel> _list;

  @override
  void initState() {
    super.initState();
    Provider.of<LembretesProvider>(context, listen: false).fetchPastLembretes();
  }

  @override
  Widget build(BuildContext context) {
    _list = context.watch<LembretesProvider>().lembreteListChecked;

    return Scaffold(
        body: _list == null ? const CircularProgressIndicator() : LembreteListWidget(_list),
    );
  }
}
