// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Solution.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Solution _$SolutionFromJson(Map<String, dynamic> json) {
  return Solution(
      json['generator'] as String,
      json['symbol'] as String,
      json['interval'] as String,
      (json['confidence'] as num)?.toDouble(),
      json['current_point_timestamp'] as int,
      (json['current_point_y'] as num)?.toDouble(),
      json['prediction_point_timestamp'] as int,
      (json['prediction_point_y'] as num)?.toDouble(),
      (json['take_profit_at_y'] as num)?.toDouble(),
      (json['stop_loss_at_y'] as num)?.toDouble(),
      json['direction'] as int,
      json['id'] as String,
      json['inspected'] as bool,
      (json['true_prediction_y'] as num)?.toDouble(),
      (json['error_rate'] as num)?.toDouble(),
      json['true_direction'] as int);
}

Map<String, dynamic> _$SolutionToJson(Solution instance) => <String, dynamic>{
      'generator': instance.generator,
      'symbol': instance.symbol,
      'interval': instance.interval,
      'confidence': instance.confidence,
      'current_point_timestamp': instance.current_point_timestamp,
      'current_point_y': instance.current_point_y,
      'prediction_point_timestamp': instance.prediction_point_timestamp,
      'prediction_point_y': instance.prediction_point_y,
      'take_profit_at_y': instance.take_profit_at_y,
      'stop_loss_at_y': instance.stop_loss_at_y,
      'direction': instance.direction,
      'id': instance.id,
      'inspected': instance.inspected,
      'true_prediction_y': instance.true_prediction_y,
      'error_rate': instance.error_rate,
      'true_direction': instance.true_direction
    };
