import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/search.dart';
import '../repositories/search_repository.dart';

class GetSearch extends UsecaseWithParams<List<Product>, SearchParams> {
  const GetSearch(this._searchRepository);
  final SearchRepository _searchRepository;

  @override
  ResultFuture<List<Product>> call(SearchParams params) async =>
      _searchRepository.search(title: params.title);
}

class SearchParams extends Equatable {
  final String title;

  const SearchParams({required this.title});

  @override
  // TODO: implement props
  List<Object?> get props => [title];
}
