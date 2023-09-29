import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/domain.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepository locationRepository;
  LocationBloc(this.locationRepository)
      : super(const LocationState(lastPage: 100)) {
    on<LocationGetResultEvent>(_handleLoadLocation);
    on<LocationGetLastPageEvent>(_handleAddInfo);
    on<LocationFilterEvent>(_handleDeleteFilter);
    on<ChangeIsLoadingLoEvent>(_handleChangeIsLoading);
    on<LocationByIdEvent>(_handleLocationById);
  }

  int currentPage = 0;
  bool isLoading = false;

  void _handleLoadLocation(
      LocationGetResultEvent event, Emitter<LocationState> emit) async {
    emit(state.copyWith(results: event.results));
  }

  void _handleAddInfo(
      LocationGetLastPageEvent event, Emitter<LocationState> emit) async {
    emit(state.copyWith(lastPage: event.lastPage));
  }

  void _handleDeleteFilter(
      LocationFilterEvent event, Emitter<LocationState> emit) {
    emit(state.copyWith(isFilter: event.isFilter, results: event.results));
  }

  void _handleLocationById(
      LocationByIdEvent event, Emitter<LocationState> emit) {
    emit(state.copyWith(result: event.result, resultsMap: event.resultMap));
  }

  void _handleChangeIsLoading(
      ChangeIsLoadingLoEvent event, Emitter<LocationState> emit) {
    emit(state.copyWith(isLoading: event.isLoading));
  }

  Future<void> handleLoadLocations() async {
    if (isLoading) return;
    isLoading = true;
    if ((currentPage != state.lastPage) && !state.isFilter) {
      state.results.isEmpty && currentPage > 0
          ? currentPage = 1
          : currentPage++;
      final List<Result> result =
          await locationRepository.getAllLocation(page: currentPage);
      add(LocationGetResultEvent([...state.results, ...result]));
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
    }
  }

  Future<void> handleAddInfo() async {
    if ((currentPage != state.lastPage) && !state.isFilter) {
      final info = await locationRepository.getInfoLocation(page: currentPage);
      add(LocationGetLastPageEvent(info.pages));
    }
  }

  Future<void> handleDeleteFilter() async {
    add(const ChangeIsLoadingLoEvent(true));
    if (isLoading) return;
    isLoading = true;
    if (state.isFilter) {
      final List<Result> locations =
          await locationRepository.getAllLocation(page: currentPage);
      add(LocationFilterEvent(isFilter: false, results: [...locations]));
      await Future.delayed(const Duration(milliseconds: 300));
      isLoading = false;
      add(const ChangeIsLoadingLoEvent(false));
    }
  }

  Future<void> handleLoadLocationId(String id) async {
    if (isLoading) return;
    isLoading = true;
    final Result location = await locationRepository.getLocationById(id);
    add(LocationByIdEvent(result: location, resultMap: {
      ...state.resultsMap,
      id: location,
    }));
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }

  Future<void> loadLocationsFilter({
    String filter = '',
    String query = '',
  }) async {
    add(const ChangeIsLoadingLoEvent(true));
    if (isLoading) return;
    isLoading = true;
    final List<Result> location = await locationRepository.getLocationByFilter(
      filter: filter,
      query: query,
    );
    add(LocationFilterEvent(isFilter: true, results: location));
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
    add(const ChangeIsLoadingLoEvent(false));
  }
}
