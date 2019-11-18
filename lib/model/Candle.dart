import 'package:json_annotation/json_annotation.dart';

part 'Candle.g.dart';

@JsonSerializable()
class Candle {
  double open;
  double high;
  double low;
  double close;
  int epoch;
  String id;
  int open_time;
  int pip_size;
  String symbol;
  int granularity;
  int volume;
  String type;

  Candle(this.open,
      this.high,
      this.low,
      this.close,
      this.epoch,
      this.id,
      this.open_time,
      this.pip_size,
      this.symbol,
      this.granularity,
      this.volume,
      this.type);

  //  /// A necessary factory constructor for creating a new User instance
//  /// from a map. Pass the map to the generated `_$UserFromMappedJson()` constructor.
//  /// The constructor is named after the source class, in this case, User.
  factory Candle.fromMappedJson(Map<String, dynamic> json) =>
      _$CandleFromJson(json);

//
//  /// `toJson` is the convention for a class to declare support for serialization
//  /// to JSON. The implementation simply calls the private, generated
//  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$CandleToJson(this);
}
