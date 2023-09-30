import 'package:json_annotation/json_annotation.dart';

part 'announcement.g.dart';

@JsonSerializable()
class Announcement {
  const Announcement({
    this.title,
    this.description,
    this.type,
    this.icon,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementFromJson(json);

  Map<String, dynamic> toJson() => _$AnnouncementToJson(this);

  final String? type;
  final String? title;
  final String? description;
  final String? icon;
}
