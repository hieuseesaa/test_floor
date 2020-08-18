import 'package:flutter_app_test/module/user.dart';

abstract class UserRepository {
  User getUser();
  void insert(User user);
}
