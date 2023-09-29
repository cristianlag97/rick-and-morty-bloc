part of feature.rickandmorty.infraestructure.datasource;

class LocationDatasourceImpl extends LocationDatasource {
  @override
  Future<List<Result>> getAllLocation({int page = 1}) async {
    final data = await GlobalGeneric.consumer<List<Result>>(
      page: page,
      queryType: 'all',
      url: '/location/',
    );
    return data;
  }

  @override
  Future<Info> getInfoLocation({int page = 1}) async {
    final data = await GlobalGeneric.consumer<Info>(
      page: page,
      url: '/location/',
    );
    return data;
  }

  @override
  Future<List<Result>> getLocationByFilter({
    String filter = '',
    String query = '',
  }) async {
    final data = await GlobalGeneric.consumer<List<Result>>(
      filter: filter,
      query: query,
      queryType: 'filter',
      url: '/location/',
    );
    return data;
  }

  @override
  Future<Result> getLocationById(String locationId) async {
    final data = await GlobalGeneric.consumer<Result>(
      id: locationId,
      url: '/location/',
    );
    return data;
  }
}
