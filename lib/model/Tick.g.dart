// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Tick.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tick _$TickFromJson(Map<String, dynamic> json) {
  return Tick(
      (json['ask'] as num)?.toDouble(),
      (json['big'] as num)?.toDouble(),
      json['epoch'] as int,
      json['id'] as String,
      json['pip_size'] as int,
      json['quote'] as int,
      json['symbol'] as String,
      json['type'] as String);
}

Map<String, dynamic> _$TickToJson(Tick instance) => <String, dynamic>{
      'ask': instance.ask,
      'big': instance.big,
      'epoch': instance.epoch,
      'id': instance.id,
      'pip_size': instance.pip_size,
      'quote': instance.quote,
      'symbol': instance.symbol,
      'type': instance.type
    };
