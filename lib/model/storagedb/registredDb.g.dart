// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registredDb.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RegistredDbAdapter extends TypeAdapter<RegistredDb> {
  @override
  final int typeId = 1;

  @override
  RegistredDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RegistredDb(
      plateNumber: fields[0] as String?,
      plateImagePath: fields[1] as String?,
      name: fields[2] as String?,
      carName: fields[3] as String?,
      eDate: fields[4] as String?,
      eTime: fields[5] as String?,
      status: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, RegistredDb obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.plateNumber)
      ..writeByte(1)
      ..write(obj.plateImagePath)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.carName)
      ..writeByte(4)
      ..write(obj.eDate)
      ..writeByte(5)
      ..write(obj.eTime)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RegistredDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}