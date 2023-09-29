part of feature.rickandmorty.infraestructure.repositories;

class LocationRepositoryImpl extends LocationRepository {
  final LocationDatasource _locationDatarource;

  LocationRepositoryImpl(this._locationDatarource);

  @override
  Future<List<Result>> getAllLocation({int page = 1}) {
    return _locationDatarource.getAllLocation(page: page);
  }

  @override
  Future<Info> getInfoLocation({int page = 1}) {
    return _locationDatarource.getInfoLocation(page: page);
  }

  @override
  Future<List<Result>> getLocationByFilter({
    String filter = '',
    String query = '',
  }) {
    return _locationDatarource.getLocationByFilter(
      filter: filter,
      query: query,
    );
  }

  @override
  Future<Result> getLocationById(String locationId) {
    return _locationDatarource.getLocationById(locationId);
  }
}
