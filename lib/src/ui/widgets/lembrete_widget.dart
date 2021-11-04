import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lembretes/src/models/lembrete_model.dart';

class LembreteWidget extends StatelessWidget {

  LembreteModel lembreteModel;

  LembreteWidget({required this.lembreteModel});

  final _dateFormat = DateFormat('d MMM yyyy');
  final _hourFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      /*decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),*/
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Text(
              lembreteModel.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _dateFormat.format(lembreteModel.quando),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                _hourFormat.format(lembreteModel.quando),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
