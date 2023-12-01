import 'package:auto_sera/src/search/domain/entities/search.dart';
import 'package:dartz/dartz.dart';
import 'package:auto_sera/core/utils/typedef.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_data_source.dart';

class SearchRepositoryImplementation extends SearchRepository {
  SearchRepositoryImplementation(this._searchDataSource);
  SearchRemoteDataSource _searchDataSource;

  @override
  ResultFuture<List<Product>> search({String? title}) async {
    // TODO: implement search
    try {
      final result = await _searchDataSource.search(title: title ?? "");
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
