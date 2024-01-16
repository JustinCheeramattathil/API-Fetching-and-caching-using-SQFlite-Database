// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider_banner_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SliderBannerAdapter extends TypeAdapter<SliderBanner> {
  @override
  final int typeId = 0;

  @override
  SliderBanner read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SliderBanner(
      imageUrls: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SliderBanner obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageUrls);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SliderBannerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
