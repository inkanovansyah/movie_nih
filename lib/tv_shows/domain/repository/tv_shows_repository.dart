import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/core/domain/entities/media.dart';
import 'package:movie_nih/core/domain/entities/media_details.dart';
import 'package:movie_nih/tv_shows/domain/entities/season_details.dart';
import 'package:movie_nih/tv_shows/domain/usecases/get_season_details_usecase.dart';

abstract class TVShowsRepository {
  Future<Either<Failure, List<List<Media>>>> getTVShows();
  Future<Either<Failure, MediaDetails>> getTVShowDetails(int id);
  Future<Either<Failure, SeasonDetails>> getSeasonDetails(
      SeasonDetailsParams params);
  Future<Either<Failure, List<Media>>> getAllPopularTVShows(int page);
  Future<Either<Failure, List<Media>>> getAllTopRatedTVShows(int page);
}
