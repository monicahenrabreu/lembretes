import 'package:flutter/material.dart';
import 'package:lembretes/ui/widgets/lembrete_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:lembretes/models/lembrete_model.dart';
import 'package:lembretes/provider/lembretes_provider.dart';

class PastLembretesPage extends StatefulWidget {
  const PastLembretesPage({Key? key}) : super(key: key);

  static String id = 'passed_lembretes';

  @override
  State<PastLembretesPage> createState() => _PastLembretesPageState();
}

class _PastLembretesPageState extends State<PastLembretesPage> {
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
        body: LembreteListWidget(_list),
    );
  }
}
