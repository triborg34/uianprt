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
  @HiveField(7)
  String? port;
  @HiveField(8)
  String? connect;
  @HiveField(9)
  bool? isRfid;
  @HiveField(10)
  bool? rl1;
  @HiveField(11)
  bool? rl2;
  @HiveField(12)
  String? rfidip;
  @HiveField(13)
  int? rfidport;
  @HiveField(14)
  bool? alarm;

  Setting(
      {this.plateConf,
      this.charConf,
      this.hardWare,
      this.dbPath,
      this.outPutPath,
      this.timeZone,
      this.clockType,
      this.connect,this.port,this.isRfid,this.rfidip,this.rfidport,this.rl1,this.rl2,required this.alarm});

  Setting.fromJson(Map<String, dynamic> json) {
    plateConf = json['plateConf'];
    charConf = json['charConf'];
    hardWare = json['hardWare'];
    dbPath = json['dbPath'];
    outPutPath = json['outPutPath'];
    timeZone = json['timeZone'];
    clockType = json['clockType'];
    connect = json['connect'];
    port = json['port'];
    isRfid = json['isRfid'];
    rl1 = json['rl1'];
    rl2 = json['rl2'];
    rfidip = json['rfidip'];
    rfidport = json['rfidport'];
    alarm = json['alarm'];

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
    data['connect'] = this.connect;
    data['port'] = this.port;
    data['isRfid'] = this.isRfid;
    data['rl1'] = this.rl1;
    data['rl2'] = this.rl2;
    data['rfidip'] = this.rfidip;
    data['rfidport'] = this.rfidport;
    data['alarm'] = this.alarm;
    return data;
  }
}