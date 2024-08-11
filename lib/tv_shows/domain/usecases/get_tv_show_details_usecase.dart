import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/core/domain/entities/media_details.dart';
import 'package:movie_nih/core/domain/usecase/base_use_case.dart';
import 'package:movie_nih/tv_shows/domain/repository/tv_shows_repository.dart';

class GetTVShowDetailsUseCase extends BaseUseCase<MediaDetails, int> {
  final TVShowsRepository _baseTVShowsRepository;

  GetTVShowDetailsUseCase(this._baseTVShowsRepository);
  @override
  Future<Either<Failure, MediaDetails>> call(int p) async {
    return await _baseTVShowsRepository.getTVShowDetails(p);
  }
}
