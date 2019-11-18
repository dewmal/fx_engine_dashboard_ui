import 'package:json_annotation/json_annotation.dart';

part 'Solution.g.dart';

@JsonSerializable()
class Solution {
  String generator;
  String symbol;
  String interval;
  double confidence;
  int current_point_timestamp;
  double current_point_y;
  int prediction_point_timestamp;
  double prediction_point_y;
  double take_profit_at_y;
  double stop_loss_at_y;
  int direction;
  String id;
  bool inspected;
  double true_prediction_y;
  double error_rate;
  int true_direction;

  Solution(
      this.generator,
      this.symbol,
      this.interval,
      this.confidence,
      this.current_point_timestamp,
      this.current_point_y,
      this.prediction_point_timestamp,
      this.prediction_point_y,
      this.take_profit_at_y,
      this.stop_loss_at_y,
      this.direction,
      this.id,
      this.inspected,
      this.true_prediction_y,
      this.error_rate,
      this.true_direction);

  //  /// A necessary factory constructor for creating a new User instance
//  /// from a map. Pass the map to the generated `_$UserFromMappedJson()` constructor.
//  /// The constructor is named after the source class, in this case, User.
  factory Solution.fromMappedJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);

  factory Solution.fromJson(Map<String, dynamic> json) =>
      _$SolutionFromJson(json);

//
//  /// `toJson` is the convention for a class to declare support for serialization
//  /// to JSON. The implementation simply calls the private, generated
//  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$SolutionToJson(this);
}
