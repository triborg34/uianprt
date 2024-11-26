
import 'package:hive/hive.dart';
part 'users.g.dart';


@HiveType(typeId: 2)
class Users extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? username;
  @HiveField(2)
  String? password;
  @HiveField(3)
  String? accsesslvl;



  Users(
      {required this.id,
      required this.username,
      required this.password,required this.accsesslvl});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    accsesslvl = json['accsesslvl'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['accsesslvl'] = this.accsesslvl;

    return data;
  }
}
