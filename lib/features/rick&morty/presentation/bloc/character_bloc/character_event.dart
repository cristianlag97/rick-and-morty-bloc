part of 'character_bloc.dart';

sealed class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object> get props => [];
}

class ChangeIsLoadingEvent extends CharacterEvent {
  final bool isLoading;

  const ChangeIsLoadingEvent(this.isLoading);
  @override
  List<Object> get props => [isLoading];
}

class CharacterGetResultEvent extends CharacterEvent {
  final List<Result> results;

  const CharacterGetResultEvent(this.results);

  @override
  List<Object> get props => [results];
}

class CharactergetLastPageEvent extends CharacterEvent {
  final int lastPage;

  const CharactergetLastPageEvent(this.lastPage);

  @override
  List<Object> get props => [lastPage];
}

class CharacterFilterEvent extends CharacterEvent {
  final bool isFilter;
  final List<Result> results;

  const CharacterFilterEvent({required this.isFilter, required this.results});

  @override
  List<Object> get props => [isFilter, results];
}

class CharacterByIdEvent extends CharacterEvent {
  final Result result;
  final Map<String, Result> resultMap;

  const CharacterByIdEvent({required this.result, required this.resultMap});

  @override
  List<Object> get props => [result, resultMap];
}
