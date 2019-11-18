// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Decision.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Decision _$DecisionFromJson(Map<String, dynamic> json) {
  return Decision(
      json['time'] as int,
      json['prediction_time'] as int,
      json['interval'] as int,
      json['symbol'] as String,
      (json['direction_confidence'] as num)?.toDouble(),
      (json['predicted_direction_confidence'] as num)?.toDouble(),
      json['direction'] as int,
      (json['direction_strength'] as num)?.toDouble(),
      (json['take_profit'] as num)?.toDouble(),
      (json['stop_loss'] as num)?.toDouble(),
      (json['current_value'] as num)?.toDouble(),
      (json['predict_value'] as num)?.toDouble(),
      json['signal_count'] as int,
      json['inspected'] as bool,
      (json['original_value'] as num)?.toDouble(),
      (json['error_rate'] as num)?.toDouble(),
      json['true_direction'] as int,
      json['id'] as String,
      json['type'] as String);
}

Map<String, dynamic> _$DecisionToJson(Decision instance) => <String, dynamic>{
      'time': instance.time,
      'prediction_time': instance.prediction_time,
      'interval': instance.interval,
      'symbol': instance.symbol,
      'direction_confidence': instance.direction_confidence,
      'predicted_direction_confidence': instance.predicted_direction_confidence,
      'direction': instance.direction,
      'direction_strength': instance.direction_strength,
      'take_profit': instance.take_profit,
      'stop_loss': instance.stop_loss,
      'current_value': instance.current_value,
      'predict_value': instance.predict_value,
      'signal_count': instance.signal_count,
      'inspected': instance.inspected,
      'original_value': instance.original_value,
      'error_rate': instance.error_rate,
      'true_direction': instance.true_direction,
      'id': instance.id,
      'type': instance.type
    };
