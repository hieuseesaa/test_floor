import 'dart:math';

import 'package:flutter_app_test/module/user.dart';
import 'package:flutter_app_test/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  User getUser() {
    final id = Random.secure().nextInt(1000);
    print("ID ====> $id");
    return User("$id", "Google");
  }
}
