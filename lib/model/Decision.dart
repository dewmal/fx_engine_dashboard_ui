import 'package:json_annotation/json_annotation.dart';

import 'Solution.dart';

part 'Decision.g.dart';

@JsonSerializable()
class Decision {
  int time;
  int prediction_time;
  int interval;
  String symbol;
  double direction_confidence;
  double predicted_direction_confidence;
  int direction;
  double direction_strength;
  double take_profit;
  double stop_loss;
  double current_value;
  double predict_value;
  int signal_count;

//   solutions;
  bool inspected;
  double original_value;
  double error_rate;
  int true_direction;
  String id;
  String type;
//  List<Solution> solutions;

  Decision(
      this.time,
      this.prediction_time,
      this.interval,
      this.symbol,
      this.direction_confidence,
      this.predicted_direction_confidence,
      this.direction,
      this.direction_strength,
      this.take_profit,
      this.stop_loss,
      this.current_value,
      this.predict_value,
      this.signal_count,
      this.inspected,
      this.original_value,
      this.error_rate,
      this.true_direction,
      this.id,
      this.type,
//      this.solutions
      ); //
//  /// A necessary factory constructor for creating a new User instance
//  /// from a map. Pass the map to the generated `_$UserFromMappedJson()` constructor.
//  /// The constructor is named after the source class, in this case, User.
  factory Decision.fromMappedJson(Map<String, dynamic> json) =>
      _$DecisionFromJson(json);

//
//  /// `toJson` is the convention for a class to declare support for serialization
//  /// to JSON. The implementation simply calls the private, generated
//  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DecisionToJson(this);
}
