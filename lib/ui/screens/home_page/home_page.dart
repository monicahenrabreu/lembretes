import 'package:flutter/material.dart';
import 'package:lembretes/ui/widgets/add_lembrete_widget.dart';
import 'package:provider/provider.dart';
import 'package:lembretes/db/db_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lembretes/models/lembrete_model.dart';
import 'package:lembretes/provider/lembretes_provider.dart';
import 'package:lembretes/ui/widgets/lembrete_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static String id = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<LembreteModel> _list;

  @override
  void initState() {
    super.initState();
    // Initializing DB
    Future initializingDB = DatabaseHelper.getInstance().db;
    Future.wait([initializingDB]).then((value) => Provider.of<LembretesProvider>(context, listen: false).fetchLembretes());
  }

  @override
  Widget build(BuildContext context) {
    _list = context.watch<LembretesProvider>().lembreteListFuture;

    return Scaffold(
      body: _list == null ? const CircularProgressIndicator() : LembreteListWidget(_list),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddLembreteDialog();
        },
        child: const Icon(Icons.add, color: Colors.black,),
        backgroundColor: Theme.of(context).primaryColor,
      )
    );
  }

  _showAddLembreteDialog() {
    showDialog(
        context: context,
        builder: (_) => Theme(
            data: Theme.of(context).copyWith(dialogBackgroundColor: const Color(0xFFf7f7f7),),
            child:  AlertDialog(
              title: Text(AppLocalizations.of(context)!.addReminder),
              content: AddLembreteWidget(),
            )));
  }
}
