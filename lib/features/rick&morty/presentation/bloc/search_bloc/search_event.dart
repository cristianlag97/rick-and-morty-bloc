part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class SearchNameCharacterEvent extends SearchEvent {
  final List<Result> characters;

  const SearchNameCharacterEvent(this.characters);

  @override
  List<Object> get props => [characters];
}
