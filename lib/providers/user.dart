import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:isar_structure/collections/user/user.dart';

class UserProvider extends ChangeNotifier {
  final Isar database;
  late List<User> userList;
  UserProvider(this.database) {
    userList = getAllUsers();
    notifyListeners();
    streamUserChanges();
  }

  void streamUserChanges() {
    Stream<void> userChanged = database.users.watchLazy();
    userChanged.listen((_) {
      debugPrint('user collection changed');
      userList = getAllUsers();
      notifyListeners();
    });
  }

  Future<void> createUser({
    required String age,
    required String name,
  }) async {
    final newUser = User()
      ..name = name
      ..age = int.parse(age);
    await database.writeTxn(() async {
      await database.users.put(newUser);
    });
  }

  Future<User?> getUser(int id) async {
    return database.users.getSync(id);
  }

  updateUser(int id, {required String name, required String age}) async {
    var existingUser = await database.users.get(id);
    existingUser!.name = name;
    existingUser.age = int.parse(age);
    await database.writeTxn(() async => await database.users.put(existingUser));
  }

  List<User> getAllUsers() {
    return database.users.where(distinct: true).findAllSync();
  }

  Future<bool?> deleteUser(int id) async {
    return await database.writeTxn(() async => await database.users.delete(id));
  }
}
