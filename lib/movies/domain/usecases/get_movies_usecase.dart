import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/core/domain/entities/media.dart';
import 'package:movie_nih/core/domain/usecase/base_use_case.dart';
import 'package:movie_nih/movies/domain/repository/movies_repository.dart';

class GetMoviesUseCase extends BaseUseCase<List<List<Media>>, NoParameters> {
  final MoviesRespository _baseMoviesRespository;

  GetMoviesUseCase(this._baseMoviesRespository);

  @override
  Future<Either<Failure, List<List<Media>>>> call(NoParameters p) async {
    return await _baseMoviesRespository.getMovies();
  }
}
