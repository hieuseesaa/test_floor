import 'dart:math';

import 'package:flutter_app_test/database/dao/user_dao.dart';
import 'package:flutter_app_test/manager/UserManager.dart';
import 'package:flutter_app_test/module/user.dart';
import 'package:flutter_app_test/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  UserManager manager;
  UserDAO userDAO;

  UserRepositoryImpl(this.manager, this.userDAO);

  @override
  User getUser() {
    manager.test();
    final id = Random.secure().nextInt(1000);
    print("ID ====> $id");
    return User("$id", "Google");
  }

  @override
  void insert(User user) async {
    userDAO.insertUser(user.toUserEntity());
  }
}
