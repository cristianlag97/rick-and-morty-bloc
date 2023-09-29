part of 'episode_bloc.dart';

sealed class EpisodeEvent extends Equatable {
  const EpisodeEvent();

  @override
  List<Object> get props => [];
}

class ChangeIsLoadingEpEvent extends EpisodeEvent {
  final bool isLoading;

  const ChangeIsLoadingEpEvent(this.isLoading);
  @override
  List<Object> get props => [isLoading];
}

class EpisodeGetResultEvent extends EpisodeEvent {
  final List<Result> results;

  const EpisodeGetResultEvent(this.results);

  @override
  List<Object> get props => [results];
}

class EpisodeGetLastPageEvent extends EpisodeEvent {
  final int lastPage;

  const EpisodeGetLastPageEvent(this.lastPage);

  @override
  List<Object> get props => [lastPage];
}

class EpisodeFilterEvent extends EpisodeEvent {
  final bool isFilter;
  final List<Result> results;

  const EpisodeFilterEvent({required this.isFilter, required this.results});

  @override
  List<Object> get props => [isFilter, results];
}

class EpisodeByIdEvent extends EpisodeEvent {
  final Result result;
  final Map<String, Result> resultMap;

  const EpisodeByIdEvent({required this.result, required this.resultMap});

  @override
  List<Object> get props => [result, resultMap];
}
