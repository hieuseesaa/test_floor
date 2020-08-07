import 'package:flutter_app_test/database/entity/user_entity.dart';

class User {
  final String id;
  final String name;

  User(this.id, this.name);

  User.init()
      : id = "0",
        name = "Test";

  UserEntity toUserEntity() => UserEntity(id, name);
}
