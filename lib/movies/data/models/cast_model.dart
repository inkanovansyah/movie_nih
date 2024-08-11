import 'package:movie_nih/core/utils/functions.dart';
import 'package:movie_nih/movies/domain/entities/cast.dart';

class CastModel extends Cast {
  const CastModel({
    required super.name,
    required super.profileUrl,
    required super.gender,
  });

  factory CastModel.fromJson(Map<String, dynamic> json) {
    return CastModel(
      name: json['name'],
      profileUrl: getProfileImageUrl(json),
      gender: json['gender'],
    );
  }
}
