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
    );
  }

  @override
  void write(BinaryWriter writer, Setting obj) {
    writer
      ..writeByte(7)
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
      ..write(obj.clockType);
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
