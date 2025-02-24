// ignore_for_file: overridden_fields

import '../../domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  final String id;
  final String iso6391;
  final String iso31661;
  @override
  final String key;
  final String name;
  final String site;
  final int size;
  @override
  final String type;

  const VideoModel({
    required this.id,
    required this.iso6391,
    required this.iso31661,
    required this.key,
    required this.name,
    required this.site,
    required this.size,
    required this.type,
  }) : super(
          title: name,
          key: key,
          type: type,
        );

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      key: json['key'],
      name: json['name'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iso_639_1': iso6391,
      'iso_3166_1': iso31661,
      'key': key,
      'name': name,
      'site': site,
      'size': size,
      'type': type,
    };
  }
}
