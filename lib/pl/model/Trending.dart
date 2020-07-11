import 'package:json_annotation/json_annotation.dart';

part 'Trending.g.dart';

@JsonSerializable()
class Trending {
  String author;
  String name;
  String avatar;
  String url;
  String description;
  String language;
  String languageColor;
  num stars;
  num forks;
  num currentPeriodStars;
  List<BuiltByBean> builtBy;

  Trending({this.author, this.name, this.avatar, this.url, this.description, this.language, this.languageColor, this.stars, this.forks, this.currentPeriodStars, this.builtBy});

  factory Trending.fromJson(Map<String, dynamic> json) => _$TrendingFromJson(json);

  Map<String, dynamic> toJson() => _$TrendingToJson(this);
}

@JsonSerializable()
class BuiltByBean {
  String href;
  String avatar;
  String username;

  BuiltByBean({this.href, this.avatar, this.username});

  factory BuiltByBean.fromJson(Map<String, dynamic> json) => _$BuiltByBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BuiltByBeanToJson(this);
}

