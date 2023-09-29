import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'episode_event.dart';
part 'episode_state.dart';

class EpisodeBloc extends Bloc<EpisodeEvent, EpisodeState> {
  final EpisodeRepository episodeRepository;
  EpisodeBloc(this.episodeRepository)
      : super(const EpisodeState(lastPage: 100)) {
    on<EpisodeGetResultEvent>(_handleLoadEpisodes);
    on<EpisodeGetLastPageEvent>(_handleAddInfo);
    on<EpisodeFilterEvent>(_handleDeleteFilter);
    on<ChangeIsLoadingEpEvent>(_handleChangeIsLoading);
    on<EpisodeByIdEvent>(_handleEpisodeById);
  }

  int currentPage = 0;
  bool isLoading = false;

  void _handleLoadEpisodes(
      EpisodeGetResultEvent event, Emitter<EpisodeState> emit) async {
    emit(state.copyWith(results: event.results));
  }

  void _handleAddInfo(
      EpisodeGetLastPageEvent event, Emitter<EpisodeState> emit) async {
    emit(state.copyWith(lastPage: event.lastPage));
  }

  void _handleDeleteFilter(
      EpisodeFilterEvent event, Emitter<EpisodeState> emit) {
    emit(state.copyWith(isFilter: event.isFilter, results: event.results));
  }

  void _handleChangeIsLoading(
      ChangeIsLoadingEpEvent event, Emitter<EpisodeState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  void _handleEpisodeById(EpisodeByIdEvent event, Emitter<EpisodeState> emit) {
    emit(state.copyWith(result: event.result, resultsMap: event.resultMap));
  }

  Future<void> handleLoadEpisodes() async {
    if (isLoading) return;
    isLoading = true;
    if ((currentPage != state.lastPage) && !state.isFilter) {
      state.results.isEmpty && currentPage > 0
          ? currentPage = 1
          : currentPage++;
      final List<Result> result =
          await episodeRepository.getAllEpisode(page: currentPage);
      add(EpisodeGetResultEvent([...state.results, ...result]));
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  void handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info = await episodeRepository.getInfoEpisode(page: currentPage);
      add(EpisodeGetLastPageEvent(info.pages));
    }
  }

  Future<void> handleDeleteFilter() async {
    add(const ChangeIsLoadingEpEvent(true));
    if (isLoading) return;
    isLoading = true;
    if (state.isFilter) {
      final List<Result> episodes =
          await episodeRepository.getAllEpisode(page: currentPage);
      add(EpisodeFilterEvent(isFilter: false, results: [...episodes]));
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      add(const ChangeIsLoadingEpEvent(false));
    }
  }

  Future<void> handleLoadEpisodeId(String id) async {
    if (isLoading) return;
    isLoading = true;
    final Result episode = await episodeRepository.getEpisodeById(id);
    add(EpisodeByIdEvent(result: episode, resultMap: {
      ...state.resultsMap,
      id: episode,
    }));
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  void loadEpisodesFilter({
    String filter = '',
    String query = '',
  }) async {
    add(const ChangeIsLoadingEpEvent(true));
    if (isLoading) return;
    isLoading = true;
    final List<Result> episode = await episodeRepository.getEpisodeByFilter(
      filter: filter,
      query: query,
    );
    add(EpisodeFilterEvent(isFilter: true, results: episode));
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    add(const ChangeIsLoadingEpEvent(false));
  }
}
