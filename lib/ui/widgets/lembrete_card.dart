import 'package:flutter/material.dart';
import 'package:lembretes/models/lembrete_model.dart';
import 'package:lembretes/ui/widgets/add_lembrete_widget.dart';
import 'package:lembretes/ui/widgets/lembrete_widget.dart';

class LembreteWidgetCard extends StatelessWidget {
  LembreteModel lembreteModel;

  LembreteWidgetCard({required this.lembreteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: Theme.of(context).cardColor,
        child: LembreteWidget(lembreteModel: lembreteModel,),
      ),
      onTap: () => _onClickItem(
        lembreteModel,
        context
      ),
    );
  }

  _onClickItem(LembreteModel lembreteModel, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: const Color(0xFFf7f7f7),),
          child:  AlertDialog(
            title: Text(lembreteModel.name),
            content: AddLembreteWidget(isEditMode: true, lembreteModel: lembreteModel),
          )),
    );
  }
}

