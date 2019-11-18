// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Candle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Candle _$CandleFromJson(Map<String, dynamic> json) {
  return Candle(
      (json['open'] as num)?.toDouble(),
      (json['high'] as num)?.toDouble(),
      (json['low'] as num)?.toDouble(),
      (json['close'] as num)?.toDouble(),
      json['epoch'] as int,
      json['id'] as String,
      json['open_time'] as int,
      json['pip_size'] as int,
      json['symbol'] as String,
      json['granularity'] as int,
      json['volume'] as int,
      json['type'] as String);
}

Map<String, dynamic> _$CandleToJson(Candle instance) => <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'epoch': instance.epoch,
      'id': instance.id,
      'open_time': instance.open_time,
      'pip_size': instance.pip_size,
      'symbol': instance.symbol,
      'granularity': instance.granularity,
      'volume': instance.volume,
      'type': instance.type
    };
