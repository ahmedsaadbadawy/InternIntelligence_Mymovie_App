import 'video_model.dart';

class VideoResultModel {
  int id;
  List<VideoModel> videos;

  VideoResultModel({required this.id, required this.videos});

  factory VideoResultModel.fromJson(Map<String, dynamic> json) {
    return VideoResultModel(
      id: json['id'],
      videos: (json['results'] as List).map((e) => VideoModel.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'results': videos.map((v) => v.toJson()).toList(),
    };
  }
}
