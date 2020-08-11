import 'package:flutter_app_test/database/app_database.dart';
import 'package:flutter_app_test/repository/user_repository.dart';
import 'package:flutter_app_test/repository_impl/user_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static Future<void> initCommon() async {
    await _registerRepository();
    await _registerDatabase();
  }

  static Future<void> _registerRepository() async {
    sl.registerSingleton(UserRepositoryImpl());
    sl.registerFactory<UserRepository>(() => sl.get<UserRepositoryImpl>());
  }

  static _registerDatabase() async {
    AppDatabase database =
    await $FloorAppDatabase.databaseBuilder('test.db').build();
    sl.registerLazySingleton(() => database.userDao);
  }
}
