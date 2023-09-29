part of 'search_bloc.dart';

class SearchState extends Equatable {
  final bool hasCharacters;
  final List<Result> characters;

  const SearchState({
    this.hasCharacters = false,
    this.characters = const <Result>[],
  });

  SearchState copyWith({
    bool? hasCharacters,
    List<Result>? characters,
  }) =>
      SearchState(
        hasCharacters: hasCharacters ?? this.hasCharacters,
        characters: characters ?? this.characters,
      );

  @override
  List<Object> get props => [hasCharacters, characters];
}
