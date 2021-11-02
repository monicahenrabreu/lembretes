import 'package:lembretes/src/db/entity.dart';

class LembreteEntity extends Entity {
  late int id;
  late String name;
  late int quando;

  LembreteEntity({required this.id, required this.name, required this.quando});

  LembreteEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    quando = map['quando'];
  }

  @override
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['quando'] = this.quando;
    return data;
  }

  @override
  String toString() {
    return 'LembreteEntity{id: $id, name: $name}';
  }
}
