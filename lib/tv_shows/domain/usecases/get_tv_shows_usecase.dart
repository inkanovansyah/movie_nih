import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/core/domain/entities/media.dart';
import 'package:movie_nih/core/domain/usecase/base_use_case.dart';
import 'package:movie_nih/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTVShowsUseCase extends BaseUseCase<List<List<Media>>, NoParameters> {
  final TVShowsRepository _baseTVShowsRepository;

  GetTVShowsUseCase(this._baseTVShowsRepository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParameters p) async {
    return await _baseTVShowsRepository.getTVShows();
  }
}
