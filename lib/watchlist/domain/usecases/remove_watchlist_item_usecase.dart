import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/core/domain/usecase/base_use_case.dart';
import 'package:movie_nih/watchlist/domain/repository/watchlist_repository.dart';

class RemoveWatchlistItemUseCase extends BaseUseCase<Unit, int> {
  final WatchlistRepository _baseWatchListRepository;

  RemoveWatchlistItemUseCase(this._baseWatchListRepository);

  @override
  Future<Either<Failure, Unit>> call(int p) async {
    return await _baseWatchListRepository.removeWatchListItem(p);
  }
}
