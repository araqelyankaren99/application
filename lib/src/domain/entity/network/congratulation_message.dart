import 'package:json_annotation/json_annotation.dart';

part 'congratulation_message.g.dart';

@JsonSerializable()
class CongratulationMessage {

  factory CongratulationMessage.fromJson(Map<String, dynamic> json) =>
      _$CongratulationMessageFromJson(json);
  const CongratulationMessage({
    this.top,
    this.bottom,
    this.bottomMessage,
  });

  final String? top;
  final String? bottom;
  final String? bottomMessage;

  Map<String, dynamic> toJson() => _$CongratulationMessageToJson(this);
}
