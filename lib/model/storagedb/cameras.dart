
import 'package:hive/hive.dart';
part 'cameras.g.dart';
@HiveType(typeId: 3)
class Cameras  extends HiveObject{
    @HiveField(0)
    int? id;
    @HiveField(1)
    String? nameCamera;
    @HiveField(2)
    String? ip;
    @HiveField(3)
    String? gate;
    @HiveField(4)
    bool? status;
    @HiveField(5)
    String? username;
    @HiveField(6)
    String? password;
    @HiveField(7)
    String? licance;
    @HiveField(8)
    String? rtspname;

     Cameras(
      
      {required this.id,
      required this.nameCamera,
      required this.rtspname,
      required this.ip,required this.gate,required this.status,required this.username,required this.password, this.licance});

  Cameras.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameCamera=json['nameCamera'];
    ip=json['ip'];
    gate=json['gate'];
    status=json['status'];
    username=json['username'];
    password=json['password'];
    rtspname=json['rtspname'];
    

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nameCamera'] = this.nameCamera;
    data['ip']=this.ip;
    data['gate']=this.gate;
    data['status']=this.status;
    data['username']=this.username;
    data['password']=this.password;
    data['rtspname']=this.rtspname;
    

    return data;
  }


}