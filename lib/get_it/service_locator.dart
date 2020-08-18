import 'package:flutter_app_test/database/app_database.dart';
import 'package:flutter_app_test/database/dao/user_dao.dart';
import 'package:flutter_app_test/manager/UserManager.dart';
import 'package:flutter_app_test/repository/user_repository.dart';
import 'package:flutter_app_test/repository_impl/user_repository_impl.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

class ServiceLocator {
  static Future<void> initCommon() async {
    sl.registerSingleton(UserManager());
    await _registerDatabase();
  }


  static _registerDatabase() async {
    AppDatabase database =
        await $FloorAppDatabase.databaseBuilder('test.db').build();
    sl.registerLazySingleton(() => database.userDao);
    sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl.get(), sl.get<UserDAO>()));
  }
}
