import 'package:floor/floor.dart';
import 'package:flutter_app_test/database/dao/user_dao.dart';
import 'package:flutter_app_test/database/entity/user_entity.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart';

@Database(version: 1, entities: [UserEntity])
abstract class AppDatabase extends FloorDatabase {
  UserDAO get userDao;
}
