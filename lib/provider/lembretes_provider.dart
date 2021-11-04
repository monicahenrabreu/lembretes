import 'package:flutter/material.dart';
import 'package:lembretes/models/lembrete_model.dart';
import 'package:lembretes/service/service_api.dart';

class LembretesProvider with ChangeNotifier{

  late List <LembreteModel> _lembreteListChecked = List.of([]);
  late List <LembreteModel> _lembreteListFuture = List.of([]);

  List<LembreteModel> get lembreteListChecked => _lembreteListChecked;
  List<LembreteModel> get lembreteListFuture => _lembreteListFuture;
  int get totalNumberLembretes => _lembreteListChecked.length + _lembreteListFuture.length;

  Future<void> fetchLembretes() async {

    _lembreteListChecked = await ServiceApi.getPastLembretes();
    _lembreteListFuture = await ServiceApi.getFutureLembretes();

    notifyListeners();
  }

  Future<void> fetchFutureLembretes() async {

    _lembreteListFuture = await ServiceApi.getFutureLembretes();

    notifyListeners();
  }

  Future<void> fetchPastLembretes() async {

    _lembreteListChecked = await ServiceApi.getPastLembretes();

    notifyListeners();
  }

  Future<bool> addLembrete(LembreteModel lembreteModel) async {

    bool result = await ServiceApi.setLembrete(lembreteModel);

    if(result){
      fetchFutureLembretes();
    }

    return result;
  }

  Future<bool> updateLembrete(LembreteModel lembreteModel) async {

    bool result = await ServiceApi.updateLembrete(lembreteModel);

    if(result) {
      fetchFutureLembretes();
    }

    return result;
  }
}