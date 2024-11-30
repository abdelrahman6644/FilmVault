// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_movie_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FullMovieModelAdapter extends TypeAdapter<FullMovieModel> {
  @override
  final int typeId = 0;

  @override
  FullMovieModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FullMovieModel(
      poster: fields[0] as String,
      id: fields[1] as int,
      original_title: fields[2] as String?,
      backGround: fields[3] as String?,
      release_date: fields[4] as String?,
      runtime: fields[5] as int?,
      overview: fields[6] as String?,
      Generes: (fields[8] as List?)?.cast<dynamic>(),
      vote_average: fields[7] as double,
    )..finalGeneres = (fields[9] as List).cast<dynamic>();
  }

  @override
  void write(BinaryWriter writer, FullMovieModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.poster)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.original_title)
      ..writeByte(3)
      ..write(obj.backGround)
      ..writeByte(4)
      ..write(obj.release_date)
      ..writeByte(5)
      ..write(obj.runtime)
      ..writeByte(6)
      ..write(obj.overview)
      ..writeByte(7)
      ..write(obj.vote_average)
      ..writeByte(8)
      ..write(obj.Generes)
      ..writeByte(9)
      ..write(obj.finalGeneres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FullMovieModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
