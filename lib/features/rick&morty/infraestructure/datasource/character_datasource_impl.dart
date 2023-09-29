part of feature.rickandmorty.infraestructure.datasource;

class CharacterDatasourceImpl extends CharacterDatasource {
  @override
  Future<List<Result>> getAllCharacter({int page = 1}) async {
    final data = await GlobalGeneric.consumer<List<Result>>(
      page: page,
      queryType: 'all',
      url: '/character/',
    );
    return data;
  }

  @override
  Future<List<Result>> getCharacterByFilter({
    String filter = '',
    String query = '',
  }) async {
    final data = await GlobalGeneric.consumer<List<Result>>(
      filter: filter,
      query: query,
      queryType: 'filter',
      url: '/character/',
    );
    return data;
  }

  @override
  Future<Result> getCharacterById(String characterId) async {
    final data = await GlobalGeneric.consumer<Result>(
      id: characterId,
      url: '/character/',
    );
    return data;
  }

  @override
  Future<List<Result>> getCharacterBySearch(String filter) async {
    if (filter.trim().isEmpty) {
      return [];
    }
    final data = await GlobalGeneric.consumer<List<Result>>(
      filter: 'name',
      query: filter,
      queryType: 'search',
      url: '/character/',
    );
    return data;
  }

  @override
  Future<Info> getInfoCharacter({int page = 1}) async {
    final data = await GlobalGeneric.consumer<Info>(
      page: page,
      url: '/character/',
    );
    return data;
  }
}
