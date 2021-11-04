import 'package:lembretes/db/lembrete_entity.dart';
import 'package:lembretes/db/lembrete_dao.dart';
import 'package:lembretes/models/lembrete_model.dart';

class ServiceApi {

  static final dao = LembreteDAO();

  static Future<List<LembreteModel>> getFutureLembretes() async {

    List<LembreteEntity> lembreteEntityList = await dao.findAllFutureLembretes();

    List<LembreteModel> lembreteListModel = transformLembreteEntityToLembreteModel(lembreteEntityList);

    return lembreteListModel;
  }

  static Future<List<LembreteModel>> getPastLembretes() async {

    List<LembreteEntity> lembreteEntityList = await dao.findAllPastLembretes();

    List<LembreteModel> lembreteListModel = transformLembreteEntityToLembreteModel(lembreteEntityList);

    return lembreteListModel;
  }

  static Future<bool> setLembrete(LembreteModel lembrete) async {

    int success = await dao.save(transformLembreteModelToLembreteEntity(lembrete));

    return success > 0;
  }

  static Future<bool> updateLembrete(LembreteModel lembrete) async {

    bool success = await dao.updateLembrete(transformLembreteModelToLembreteEntity(lembrete));

    return success;
  }

  static List<LembreteModel> transformLembreteEntityToLembreteModel(List<LembreteEntity> lembreteEntityList) {

    List<LembreteModel> lembreteList = List.of([]);

    lembreteEntityList.forEach((element) => lembreteList.add(LembreteModel(id: element.id, name: element.name, quando: DateTime.fromMicrosecondsSinceEpoch(element.quando))));

    return lembreteList;
  }

  static LembreteEntity transformLembreteModelToLembreteEntity(LembreteModel lembreteModel) {

    return LembreteEntity(id: lembreteModel.id, name: lembreteModel.name, quando: lembreteModel.quando.microsecondsSinceEpoch);
  }
}
