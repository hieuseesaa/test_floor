import 'package:floor/floor.dart';
import 'package:flutter_app_test/database/entity/user_entity.dart';

@dao
abstract class UserDAO {
  @Query('SELECT * FROM user')
  Future<List<UserEntity>> getAllCondition();

  @insert
  Future<int> insertUser(UserEntity userEntity);

  @update
  Future<int> updateUser(UserEntity userEntity);

  @delete
  Future<void> deleteUser(UserEntity userEntity);
}
