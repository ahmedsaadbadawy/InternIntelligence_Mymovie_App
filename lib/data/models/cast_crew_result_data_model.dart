// ignore_for_file: overridden_fields

import '../../domain/entities/cast_entity.dart';

class CastCrewResultModel {
  int id;
  List<CastModel> cast;
  List<Crew> crew;

  CastCrewResultModel({required this.id, required this.cast, required this.crew});

  factory CastCrewResultModel.fromJson(Map<String, dynamic> json) {
    return CastCrewResultModel(
      id: json['id'],
      cast: (json['cast'] as List).map((e) => CastModel.fromJson(e)).toList(),
      crew: (json['crew'] as List).map((e) => Crew.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cast': cast.map((e) => e.toJson()).toList(),
      'crew': crew.map((e) => e.toJson()).toList(),
    };
  }
}

class CastModel extends CastEntity {
  final int castId;
  @override
  final String character;
  @override
  final String creditId;
  final int gender;
  final int id;
  @override
  final String name;
  final int order;
  final String profilePath;

  const CastModel({
    required this.castId,
    required this.character,
    required this.creditId,
    required this.gender,
    required this.id,
    required this.name,
    required this.order,
    required this.profilePath,
  }) : super(
          creditId: creditId,
          name: name,
          posterPath: profilePath,
          character: character,
        );

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      castId: json['cast_id'],
      character: json['character'],
      creditId: json['credit_id'],
      gender: json['gender'],
      id: json['id'],
      name: json['name'],
      order: json['order'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cast_id': castId,
      'character': character,
      'credit_id': creditId,
      'gender': gender,
      'id': id,
      'name': name,
      'order': order,
      'profile_path': profilePath,
    };
  }
}

class Crew {
  String creditId;
  String department;
  int gender;
  int id;
  String job;
  String name;
  String profilePath;

  Crew({
    required this.creditId,
    required this.department,
    required this.gender,
    required this.id,
    required this.job,
    required this.name,
    required this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      creditId: json['credit_id'],
      department: json['department'],
      gender: json['gender'],
      id: json['id'],
      job: json['job'],
      name: json['name'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'credit_id': creditId,
      'department': department,
      'gender': gender,
      'id': id,
      'job': job,
      'name': name,
      'profile_path': profilePath,
    };
  }
}
