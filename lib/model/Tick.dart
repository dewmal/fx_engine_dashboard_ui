import 'package:json_annotation/json_annotation.dart';

part 'Tick.g.dart';

@JsonSerializable()
class Tick {
  double ask;
  double big;
  int epoch;
  String id;
  int pip_size;
  int quote;
  String symbol;
  String type;

  Tick(
      this.ask,
      this.big,
      this.epoch,
      this.id,
      this.pip_size,
      this.quote,
      this.symbol,
      this.type); //  /// A necessary factory constructor for creating a new User instance
//  /// from a map. Pass the map to the generated `_$UserFromMappedJson()` constructor.
//  /// The constructor is named after the source class, in this case, User.
  factory Tick.fromMappedJson(Map<String, dynamic> json) =>
      _$TickFromJson(json);

//
//  /// `toJson` is the convention for a class to declare support for serialization
//  /// to JSON. The implementation simply calls the private, generated
//  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$TickToJson(this);
}
