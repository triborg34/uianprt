// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cameras.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CamerasAdapter extends TypeAdapter<Cameras> {
  @override
  final int typeId = 3;

  @override
  Cameras read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cameras(
      id: fields[0] as int?,
      nameCamera: fields[1] as String?,
      rtspname: fields[8] as String?,
      rtpath: fields[10] as String?,
      ip: fields[2] as String?,
      gate: fields[3] as String?,
      status: fields[4] as bool?,
      username: fields[5] as String?,
      password: fields[6] as String?,
      isNotrtsp: fields[9] as bool?,
      licance: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Cameras obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.nameCamera)
      ..writeByte(2)
      ..write(obj.ip)
      ..writeByte(3)
      ..write(obj.gate)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.username)
      ..writeByte(6)
      ..write(obj.password)
      ..writeByte(7)
      ..write(obj.licance)
      ..writeByte(8)
      ..write(obj.rtspname)
      ..writeByte(9)
      ..write(obj.isNotrtsp)
      ..writeByte(10)
      ..write(obj.rtpath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CamerasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
