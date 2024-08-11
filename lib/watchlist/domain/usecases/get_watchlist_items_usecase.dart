import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/core/domain/entities/media.dart';
import 'package:movie_nih/core/domain/usecase/base_use_case.dart';
import 'package:movie_nih/watchlist/domain/repository/watchlist_repository.dart';

class GetWatchlistItemsUseCase extends BaseUseCase<List<Media>, NoParameters> {
  final WatchlistRepository _baseWatchListRepository;

  GetWatchlistItemsUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, List<Media>>> call(NoParameters p) async {
    return await _baseWatchListRepository.getWatchListItems();
  }
}
