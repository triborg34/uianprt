
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
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? nickname;



  Users(
      {required this.id,
      required this.username,
      required this.password,required this.accsesslvl,required this.email,required this.nickname});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    accsesslvl = json['accsesslvl'];
    email=json['email'];
    nickname=json['nickname'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['accsesslvl'] = this.accsesslvl;
    data['email']=this.email;
    data['nickname']=this.nickname;

    return data;
  }
}
