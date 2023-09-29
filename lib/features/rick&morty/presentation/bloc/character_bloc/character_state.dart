part of 'character_bloc.dart';

class CharacterState extends Equatable {
  final bool isFilter;
  final bool isLoading;
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;
  const CharacterState({
    required this.lastPage,
    this.results = const <Result>[],
    this.isFilter = false,
    this.isLoading = false,
    this.result,
    this.resultsMap = const {},
  });

  CharacterState copyWith({
    bool? isFilter,
    bool? isLoading,
    int? lastPage,
    List<Result>? results,
    Map<String, Result>? resultsMap,
    Result? result,
  }) =>
      CharacterState(
        isFilter: isFilter ?? this.isFilter,
        isLoading: isLoading ?? this.isLoading,
        lastPage: lastPage ?? this.lastPage,
        results: results ?? this.results,
        resultsMap: resultsMap ?? this.resultsMap,
        result: result ?? this.result,
      );

  @override
  List<Object> get props => [
        isFilter,
        isLoading,
        lastPage,
        results,
        resultsMap,
      ];
}
