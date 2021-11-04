import 'package:flutter/material.dart';
import 'package:lembretes/src/models/lembrete_model.dart';
import 'package:lembretes/src/ui/widgets/lembrete_widget.dart';

class LembreteWidgetCard extends StatelessWidget {
  LembreteModel lembreteModel;

  LembreteWidgetCard({required this.lembreteModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Card(
          color: const Color(0xffFFDB84),
          child: LembreteWidget(lembreteModel: lembreteModel,),
        ),
        /*decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 5.0,
            ),
          ],
        ),*/
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
            content: const Text('onClick'),
          )),
    );
  }
}

