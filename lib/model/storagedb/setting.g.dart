// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingAdapter extends TypeAdapter<Setting> {
  @override
  final int typeId = 4;

  @override
  Setting read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Setting(
      plateConf: fields[0] as double?,
      charConf: fields[1] as double?,
      hardWare: fields[2] as String?,
      dbPath: fields[3] as String?,
      outPutPath: fields[4] as String?,
      timeZone: fields[5] as String?,
      clockType: fields[6] as String?,
      connect: fields[8] as String?,
      port: fields[7] as String?,
      isRfid: fields[9] as bool?,
      rfidip: fields[12] as String?,
      rfidport: fields[13] as int?,
      rl1: fields[10] as bool?,
      rl2: fields[11] as bool?,
      alarm: fields[14] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Setting obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.plateConf)
      ..writeByte(1)
      ..write(obj.charConf)
      ..writeByte(2)
      ..write(obj.hardWare)
      ..writeByte(3)
      ..write(obj.dbPath)
      ..writeByte(4)
      ..write(obj.outPutPath)
      ..writeByte(5)
      ..write(obj.timeZone)
      ..writeByte(6)
      ..write(obj.clockType)
      ..writeByte(7)
      ..write(obj.port)
      ..writeByte(8)
      ..write(obj.connect)
      ..writeByte(9)
      ..write(obj.isRfid)
      ..writeByte(10)
      ..write(obj.rl1)
      ..writeByte(11)
      ..write(obj.rl2)
      ..writeByte(12)
      ..write(obj.rfidip)
      ..writeByte(13)
      ..write(obj.rfidport)
      ..writeByte(14)
      ..write(obj.alarm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
