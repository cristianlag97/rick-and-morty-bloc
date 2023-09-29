part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool isFilter;
  final bool isLoading;
  final int lastPage;
  final List<Result> results;
  final Map<String, Result> resultsMap;
  final Result? result;
  const LocationState({
    required this.lastPage,
    this.results = const <Result>[],
    this.isFilter = false,
    this.isLoading = false,
    this.result,
    this.resultsMap = const {},
  });

  LocationState copyWith({
    bool? isFilter,
    bool? isLoading,
    int? lastPage,
    List<Result>? results,
    Map<String, Result>? resultsMap,
    Result? result,
  }) =>
      LocationState(
        isFilter: isFilter ?? this.isFilter,
        isLoading: isLoading ?? this.isLoading,
        lastPage: lastPage ?? this.lastPage,
        results: results ?? this.results,
        resultsMap: resultsMap ?? this.resultsMap,
        result: result ?? this.result,
      );

  @override
  List<Object> get props =>
      [isFilter, isLoading, lastPage, results, resultsMap];
}
