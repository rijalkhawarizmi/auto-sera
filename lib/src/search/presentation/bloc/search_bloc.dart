import 'package:auto_sera/src/search/domain/entities/search.dart';
import 'package:auto_sera/src/search/domain/usecases/get_search.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._getSearch) : super(SearchInitial()) {
    on<EventSearch>(_getProductHandler);
  }
  final GetSearch _getSearch;
  Future<void> _getProductHandler(
      EventSearch event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    final result = await _getSearch(SearchParams(title: event.title ?? ''));
    result.fold(
        (failure) => emit(SearchError(
            message: '${failure.statusCode}' 'Error: ${failure.errorMessage}')),
        (data) {
      if (data.isEmpty) {
        emit(SearchError(message: 'Not Found'));
      } else {
        emit(SearchSuccess(data));
      }
    });
  }
}
