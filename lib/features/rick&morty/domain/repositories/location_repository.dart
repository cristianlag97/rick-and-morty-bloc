part of features.rickandmorty.domain.repository;

abstract class LocationRepository {
  Future<Info> getInfoLocation({int page = 1});
  Future<List<Result>> getAllLocation({int page = 1});
  Future<List<Result>> getLocationByFilter({String filter, String query});
  Future<Result> getLocationById(String locationId);
}
