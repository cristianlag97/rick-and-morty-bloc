import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository characterRepository;

  CharacterBloc(this.characterRepository)
      : super(const CharacterState(lastPage: 100)) {
    on<CharacterGetResultEvent>(_handleLoadCharacters);
    on<CharactergetLastPageEvent>(_handleAddInfo);
    on<CharacterFilterEvent>(_handleDeleteFilter);
    on<ChangeIsLoadingEvent>(_handleChangeIsLoading);
    on<CharacterByIdEvent>(_handleCharacterById);
  }

  int currentPage = 0;
  bool isLoading = false;

  void _handleLoadCharacters(
      CharacterGetResultEvent event, Emitter<CharacterState> emit) async {
    emit(state.copyWith(results: event.results));
  }

  void _handleAddInfo(
      CharactergetLastPageEvent event, Emitter<CharacterState> emit) async {
    emit(state.copyWith(lastPage: event.lastPage));
  }

  void _handleDeleteFilter(
      CharacterFilterEvent event, Emitter<CharacterState> emit) {
    emit(state.copyWith(isFilter: event.isFilter, results: event.results));
  }

  void _handleChangeIsLoading(
      ChangeIsLoadingEvent event, Emitter<CharacterState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _handleCharacterById(
      CharacterByIdEvent event, Emitter<CharacterState> emit) {
    emit(state.copyWith(result: event.result, resultsMap: event.resultMap));
  }

  Future<void> handleLoadCharacters() async {
    if (isLoading) return;
    isLoading = true;
    if ((currentPage != state.lastPage) && !state.isFilter) {
      state.results.isEmpty && currentPage > 0
          ? currentPage = 1
          : currentPage++;
      final List<Result> result =
          await characterRepository.getAllCharacter(page: currentPage);
      add(CharacterGetResultEvent([...state.results, ...result]));
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  void handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info =
          await characterRepository.getInfoCharacter(page: currentPage);
      add(CharactergetLastPageEvent(info.pages));
    }
  }

  Future<void> handleDeleteFilter() async {
    add(const ChangeIsLoadingEvent(true));
    if (isLoading) return;
    isLoading = true;
    if (state.isFilter) {
      final List<Result> characters =
          await characterRepository.getAllCharacter(page: currentPage);
      add(CharacterFilterEvent(isFilter: false, results: [...characters]));
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      add(const ChangeIsLoadingEvent(false));
    }
  }

  Future<void> handleLoadCharacterId(String id) async {
    if (isLoading) return;
    isLoading = true;
    final Result character = await characterRepository.getCharacterById(id);
    add(CharacterByIdEvent(result: character, resultMap: {
      ...state.resultsMap,
      id: character,
    }));
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  Future<void> loadCharactersFilter({
    String filter = '',
    String query = '',
  }) async {
    add(const ChangeIsLoadingEvent(true));
    if (isLoading) return;
    isLoading = true;
    final List<Result> character =
        await characterRepository.getCharacterByFilter(
      filter: filter,
      query: query,
    );
    add(CharacterFilterEvent(isFilter: true, results: character));
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    add(const ChangeIsLoadingEvent(false));
  }
}
