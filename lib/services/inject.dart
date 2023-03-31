import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:isar_structure/collections/thoughts/thought.dart';
import 'package:isar_structure/collections/user/user.dart';
import 'package:isar_structure/providers/thought.dart';
import 'package:isar_structure/providers/user.dart';

final serviceLocator = GetIt.instance;

class Inject {
  static init() {
    registerDbAndProviders();
  }

  static registerDbAndProviders() async {
    var db = await Isar.open([UserSchema, ThoughtSchema]);
    GetIt.I.registerLazySingleton<ThoughtProvider>(() => ThoughtProvider(db));
    GetIt.I.registerLazySingleton<UserProvider>(() => UserProvider(db));
  }
}
