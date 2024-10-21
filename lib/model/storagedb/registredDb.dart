import 'package:hive/hive.dart';
part 'registredDb.g.dart';

@HiveType(typeId: 1)
class RegistredDb extends HiveObject {
  @HiveField(0)
  String? plateNumber;

  @HiveField(1)
  String? plateImagePath;

  @HiveField(2)
  String? name;
  @HiveField(3)
  String? carName ;
  @HiveField(4)
  String? eDate;
  @HiveField(5)
  String? eTime;
  @HiveField(6)
  bool? status;

  RegistredDb(
      {required this.plateNumber,
      required this.plateImagePath,
      this.name='-',
      this.carName='-',
      required this.eDate,
      required this.eTime,this.status=false});

  RegistredDb.fromJson(Map<String, dynamic> json) {
    plateNumber = json['plateNumber'];
    plateImagePath = json['plateImagePath'];
    name = json['name'];
    carName = json['carName'];
    eDate = json['eDate'];
    eTime = json['eTime'];
    status=json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plateNumber'] = this.plateNumber;
    data['plateImagePath'] = this.plateImagePath;
    data['name'] = this.name;
    data['carName'] = this.carName;
    data['eDate'] = this.eDate;
    data['eTime'] = this.eTime;
    data['status']=this.status;
    return data;
  }
}