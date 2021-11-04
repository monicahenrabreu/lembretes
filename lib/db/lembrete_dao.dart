import 'package:lembretes/db/lembrete_entity.dart';
import 'package:lembretes/db/base_dao.dart';

// Data Access Object
class LembreteDAO extends BaseDAO<LembreteEntity> {
  @override
  String get tableName => "Lembrete";

  @override
  LembreteEntity fromMap(Map<String, dynamic> map) {
    return LembreteEntity.fromMap(map);
  }

  Future<List<LembreteEntity>> findAllFutureLembretes() async {

    int now = DateTime.now().subtract(Duration(days:1)).microsecondsSinceEpoch;

    return query('select * from $tableName where quando >= $now order by quando asc');
  }

  Future<List<LembreteEntity>> findAllPastLembretes() async {
    int now = DateTime.now().subtract(Duration(days:1)).microsecondsSinceEpoch;

    return query('select * from $tableName where quando < $now order by quando asc');
  }

  Future<List<LembreteEntity>> findAllByTipo(String tipo) async {
    return query('select * from $tableName where tipo =? ', [tipo]);
  }

  Future<bool> updateLembrete(LembreteEntity entity) async {
    var dbClient = await db;

    int updateCount = await dbClient!.rawUpdate('''
    UPDATE $tableName 
    SET name = ?, quando = ? 
    WHERE id = ?
    ''', [entity.name, entity.quando, entity.id]);

    return updateCount > 0;
  }
}
