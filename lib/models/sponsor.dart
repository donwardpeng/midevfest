import 'package:json_annotation/json_annotation.dart';

part 'sponsor.g.dart';

@JsonSerializable()
class Sponsor {
  Sponsor({this.name, this.url, this.logoUrl, this.width, this.height});
  final String name;
  final String url;
  final String logoUrl;
  final int width;
  final int height;
  factory Sponsor.fromJson(Map<String, dynamic> json) => _$SponsorFromJson(json);
  Map<String, dynamic> toJson() => _$SponsorToJson(this);
}
