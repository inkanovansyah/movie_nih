import 'package:dartz/dartz.dart';
import 'package:movie_nih/core/data/error/failure.dart';
import 'package:movie_nih/search/domain/entities/search_result_item.dart';

abstract class SearchRepository {
  Future<Either<Failure, List<SearchResultItem>>> search(String title);
}
