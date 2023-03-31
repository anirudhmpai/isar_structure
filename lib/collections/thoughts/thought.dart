import 'package:isar/isar.dart';

part 'thought.g.dart';

@collection
class Thought {
  Id id = Isar.autoIncrement;
  int? userId;
  String? thought;
}
