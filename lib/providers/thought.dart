import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_structure/collections/thoughts/thought.dart';

class ThoughtProvider extends ChangeNotifier {
  final Isar database;
  late List<Thought> thoughts;
  late int currentUserId;
  ThoughtProvider(this.database) {
    thoughts = [];
    notifyListeners();
    streamThoughtChanges();
  }

  void streamThoughtChanges() {
    Stream<void> userChanged = database.thoughts.watchLazy();
    userChanged.listen((_) {
      debugPrint('thought collection changed');
      thoughts = getAllThoughts();
      notifyListeners();
    });
  }

  initThought(int userId) {
    currentUserId = userId;
    thoughts =
        database.thoughts.filter().userIdEqualTo(currentUserId).findAllSync();
    notifyListeners();
  }

  Future<void> createThought({
    required String thought,
  }) async {
    final newThought = Thought()
      ..thought = thought
      ..userId = currentUserId;
    await database.writeTxn(() async {
      await database.thoughts.put(newThought);
    });
  }

  List<Thought> getAllThoughts() {
    return database.thoughts
        .filter()
        .userIdEqualTo(currentUserId)
        .findAllSync();
  }

  updateThought(int thoughtId, {required String thought}) async {
    var existingThought = await database.thoughts.get(thoughtId);
    existingThought!.thought = thought;
    await database
        .writeTxn(() async => await database.thoughts.put(existingThought));
  }

  Future<Thought?> getThought(int thoughtId) async {
    return database.thoughts.getSync(thoughtId);
  }

  deleteThought(Id id) async {
    return await database
        .writeTxn(() async => await database.thoughts.delete(id));
  }
}
