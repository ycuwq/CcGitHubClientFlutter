import 'package:ccgithubclientflutter/pl/model/repo.dart';
import 'package:ccgithubclientflutter/pl/model/User.dart';
import 'package:json_annotation/json_annotation.dart';

import 'EventPayload.dart';


part 'Event.g.dart';

@JsonSerializable()
class Event {
  String id;
  String type;
  User actor;
  Repo repo;
  User org;
  EventPayload payload;
  @JsonKey(name: "public")
  bool isPublic;
  @JsonKey(name: "created_at")
  DateTime createdAt;

  Event(
    this.id,
    this.type,
    this.actor,
    this.repo,
    this.org,
    this.isPublic,
    this.createdAt,
  );

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);

  Map<String, dynamic> toJson() => _$EventToJson(this);

}
