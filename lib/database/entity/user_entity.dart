import 'package:floor/floor.dart';

@Entity(tableName: "user")
class UserEntity {
  @PrimaryKey(autoGenerate: true)
  int id;

  @ColumnInfo(name: "user_id")
  String userId;

  @ColumnInfo(name: "name")
  String name;

  UserEntity(this.userId, this.name);
}
