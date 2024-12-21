import 'package:hive/hive.dart';
part 'setting.g.dart';
@HiveType(typeId: 4)
class Setting {
  @HiveField(0)
  double? plateConf;
  @HiveField(1)
  double? charConf;
  @HiveField(2)
  String? hardWare;
  @HiveField(3)
  String? dbPath;
  @HiveField(4)
  String? outPutPath;
  @HiveField(5)
  String? timeZone;
  @HiveField(6)
  String? clockType;

  Setting(
      {this.plateConf,
      this.charConf,
      this.hardWare,
      this.dbPath,
      this.outPutPath,
      this.timeZone,
      this.clockType});

  Setting.fromJson(Map<String, dynamic> json) {
    plateConf = json['plateConf'];
    charConf = json['charConf'];
    hardWare = json['hardWare'];
    dbPath = json['dbPath'];
    outPutPath = json['outPutPath'];
    timeZone = json['timeZone'];
    clockType = json['clockType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plateConf'] = this.plateConf;
    data['charConf'] = this.charConf;
    data['hardWare'] = this.hardWare;
    data['dbPath'] = this.dbPath;
    data['outPutPath'] = this.outPutPath;
    data['timeZone'] = this.timeZone;
    data['clockType'] = this.clockType;
    return data;
  }
}