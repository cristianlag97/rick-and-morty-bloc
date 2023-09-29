part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class ChangeIsLoadingLoEvent extends LocationEvent {
  final bool isLoading;

  const ChangeIsLoadingLoEvent(this.isLoading);
  @override
  List<Object> get props => [isLoading];
}

class LocationGetResultEvent extends LocationEvent {
  final List<Result> results;

  const LocationGetResultEvent(this.results);

  @override
  List<Object> get props => [results];
}

class LocationGetLastPageEvent extends LocationEvent {
  final int lastPage;

  const LocationGetLastPageEvent(this.lastPage);

  @override
  List<Object> get props => [lastPage];
}

class LocationFilterEvent extends LocationEvent {
  final bool isFilter;
  final List<Result> results;

  const LocationFilterEvent({required this.isFilter, required this.results});

  @override
  List<Object> get props => [isFilter, results];
}

class LocationByIdEvent extends LocationEvent {
  final Result result;
  final Map<String, Result> resultMap;

  const LocationByIdEvent({required this.result, required this.resultMap});

  @override
  List<Object> get props => [result, resultMap];
}
