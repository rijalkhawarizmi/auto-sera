part of 'search_bloc.dart';

abstract class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class SearchLoading extends SearchState {}
class SearchSuccess extends SearchState {
  const SearchSuccess(this.search);

  final List<Product> search;
  @override
  List<Object> get props => search.map((e) => e.id!).toList();
}
class SearchError extends SearchState {
  final String message;
  const SearchError({required this.message});
}
class SearchEmpty extends SearchState {
  final String message;
  const SearchEmpty({required this.message});
}
