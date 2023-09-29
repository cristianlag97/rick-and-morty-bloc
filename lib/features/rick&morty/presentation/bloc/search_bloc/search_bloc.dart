import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final CharacterRepository characterRepository;
  SearchBloc(this.characterRepository) : super(const SearchState()) {
    on<SearchNameCharacterEvent>(_handleSearchCharacter);
  }

  void _handleSearchCharacter(
      SearchNameCharacterEvent event, Emitter<SearchState> emit) {
    emit(state.copyWith(characters: event.characters));
  }

  bool isLoading = false;
  Timer? _debounce;
  final _searchController = StreamController<List<Result>>();
  Stream<List<Result>> get searchResultsStream => _searchController.stream;

  Future<void> loadSearchResult(String filter) async {
    if (isLoading) return;

    if (_debounce != null) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () async {
      isLoading = true;

      try {
        final List<Result> characters =
            await characterRepository.getCharacterBySearch(filter);

        if (!_searchController.isClosed) {
          _searchController.sink.add(characters);
        }

        if (!isClosed) {
          add(SearchNameCharacterEvent(characters));
        }
      } catch (e) {
        debugPrint('Error al agregar eventos: $e');
      }

      isLoading = false;
    });
  }
}
