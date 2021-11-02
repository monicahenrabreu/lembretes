import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lembretes/src/models/lembrete_model.dart';
import 'package:lembretes/src/provider/lembretes_provider.dart';
import 'package:lembretes/src/widgets/text_widget.dart';


class AddLembreteWidget extends StatefulWidget {
  bool isEditMode;
  LembreteModel? lembreteModel;

  AddLembreteWidget({this.lembreteModel, this.isEditMode = false});

  @override
  _AddLembreteWidgetState createState() => _AddLembreteWidgetState();
}

class _AddLembreteWidgetState extends State<AddLembreteWidget> {
  final TextEditingController _controllerName = TextEditingController();
  late TextEditingController _dateTimePickerController;
  //final _focusSenha = FocusNode();
  final _formKey = GlobalKey<FormState>();
  late double _height;
  late double _width;
  final DateFormat _dateTimeFormat = DateFormat('yyyy-MM-dd HH:mm');

  bool get _isEditMode => widget.isEditMode;
  LembreteModel? get _reminder => widget.lembreteModel;

  @override
  void initState() {
    super.initState();
    _dateTimePickerController = TextEditingController(text: DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height / 4;
    _width = MediaQuery.of(context).size.width;

    if(_isEditMode){
      _controllerName.text = _reminder!.name;
      _dateTimePickerController.text = _reminder!.quando.toString();
    }

    return Form(
      key: _formKey,
      child: Container(
        height: _height,
        width: _width,
        padding: const EdgeInsets.all(1),
        child: Column(
          children: [
            TextWidget(
              AppLocalizations.of(context)!.whatReminder,
              AppLocalizations.of(context)!.addReminderExample,
              controller: _controllerName,
              //validator: _validateName,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              //nextFocus: _focusSenha,
            ),
            const SizedBox(
              height: 20,
            ),
            DateTimePicker(
              type: DateTimePickerType.dateTimeSeparate,
              dateMask: 'd MMM yyyy',
              controller: _dateTimePickerController,
              firstDate: DateTime.now(),
              lastDate: DateTime(2200),
              icon: const Padding(
                padding: EdgeInsets.fromLTRB(5.0, 4.0, 0.0, 1.0),
                child: Icon(Icons.event),
              ),
              dateLabelText: AppLocalizations.of(context)!.addReminderDueDate,
              timeLabelText: AppLocalizations.of(context)!.addReminderDueTime,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.cancelReminder, style: const TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.black, fontSize: 18),
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: _onPressedCancel,
                ),
                ElevatedButton(
                  child: Text(AppLocalizations.of(context)!.saveReminder, style: const TextStyle(color: Colors.black),),
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: Colors.black, fontSize: 18),
                    primary: Theme.of(context).primaryColor,
                  ),
                  onPressed: () => _onPressedSave(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String text) {
    if (text.isEmpty) {
      return AppLocalizations.of(context)!.addReminderNoName;
    }
    return null;
  }

  _onPressedSave(context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    bool success = await _addOrUpdateLembrete();

    _showToast(success);

    Navigator.of(context).pop();
  }

  Future<bool> _addOrUpdateLembrete() async {

    DateTime _date = _dateTimeFormat.parse(_dateTimePickerController.value.text);
    bool success;

    if(_isEditMode){
      success = await Provider.of<LembretesProvider>(context, listen: false).updateLembrete(LembreteModel(
        id: _reminder!.id,
        name: _controllerName.text,
        quando: _date,
      ));
    } else {
      success = await Provider.of<LembretesProvider>(context, listen: false).addLembrete(LembreteModel(
        id: context.read<LembretesProvider>().totalNumberLembretes + 1,
        name: _controllerName.text,
        quando: _date,
      ));
    }
    return success;
  }

  void _showToast(bool success) {
    if (success) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.addReminderSaved,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context)!.addReminderNotSavedError,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFF900000),
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  _onPressedCancel() {
    Navigator.of(context).pop();
  }
}
