import 'package:flutter/material.dart';
import 'package:lembretes/src/models/lembrete_model.dart';
import 'package:lembretes/src/ui/widgets/lembrete_card.dart';

class LembreteListWidget extends StatefulWidget {

  List<LembreteModel> _list;

  LembreteListWidget(this._list);

  @override
  _LembreteListWidgetState createState() => _LembreteListWidgetState();
}

class _LembreteListWidgetState extends State<LembreteListWidget>
    with AutomaticKeepAliveClientMixin<LembreteListWidget> {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return _listView(widget._list);
  }

  _listView(List<LembreteModel> lembretes) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: lembretes.length,
        itemBuilder: (context, index) {
          return LembreteWidgetCard(lembreteModel: lembretes[index]);
        },
      ),
    );
  }

}
