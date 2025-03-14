// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_registrar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiamondAdapter extends TypeAdapter<Diamond> {
  @override
  final int typeId = 0;

  @override
  Diamond read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diamond(
      qty: fields[0] as num,
      lotID: fields[1] as String,
      size: fields[2] as String,
      carat: fields[3] as num,
      lab: fields[4] as String,
      shape: fields[5] as String,
      color: fields[6] as String,
      clarity: fields[7] as String,
      cut: fields[8] as String,
      polish: fields[9] as String,
      symmetry: fields[10] as String,
      fluorescence: fields[11] as String,
      discount: fields[12] as num,
      perCaratRate: fields[13] as num,
      finalAmount: fields[14] as num,
      keyToSymbol: fields[15] as String,
      labComment: fields[16] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Diamond obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.qty)
      ..writeByte(1)
      ..write(obj.lotID)
      ..writeByte(2)
      ..write(obj.size)
      ..writeByte(3)
      ..write(obj.carat)
      ..writeByte(4)
      ..write(obj.lab)
      ..writeByte(5)
      ..write(obj.shape)
      ..writeByte(6)
      ..write(obj.color)
      ..writeByte(7)
      ..write(obj.clarity)
      ..writeByte(8)
      ..write(obj.cut)
      ..writeByte(9)
      ..write(obj.polish)
      ..writeByte(10)
      ..write(obj.symmetry)
      ..writeByte(11)
      ..write(obj.fluorescence)
      ..writeByte(12)
      ..write(obj.discount)
      ..writeByte(13)
      ..write(obj.perCaratRate)
      ..writeByte(14)
      ..write(obj.finalAmount)
      ..writeByte(15)
      ..write(obj.keyToSymbol)
      ..writeByte(16)
      ..write(obj.labComment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiamondAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
