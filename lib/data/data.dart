import 'package:json_annotation/json_annotation.dart';
part 'data.g.dart';

enum ScreenState { error, loaded, loading }

@JsonSerializable()
class PhotoResponse {
  PhotoResponse(
      {required this.albumId,
        required this.id,
        required this.title,
        required this.thumbnailUrl,
        required this.url});
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory PhotoResponse.fromJson(Map<String, dynamic> json) => _$PhotoResponseFromJson(json);


  /*PhotoResponse.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];*/
}