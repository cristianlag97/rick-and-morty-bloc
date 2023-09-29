part of feature.rickandmorty.infraestructure.repositories;

class CharacterRepositoryImpl extends CharacterRepository {
  final CharacterDatasource _characterDatarource;

  CharacterRepositoryImpl(this._characterDatarource);

  @override
  Future<List<Result>> getAllCharacter({int page = 1}) {
    return _characterDatarource.getAllCharacter(page: page);
  }

  @override
  Future<List<Result>> getCharacterByFilter({
    String filter = '',
    String query = '',
  }) {
    return _characterDatarource.getCharacterByFilter(
      filter: filter,
      query: query,
    );
  }

  @override
  Future<Result> getCharacterById(String characterId) {
    return _characterDatarource.getCharacterById(characterId);
  }

  @override
  Future<List<Result>> getCharacterBySearch(String filter) {
    return _characterDatarource.getCharacterBySearch(filter);
  }

  @override
  Future<Info> getInfoCharacter({int page = 1}) {
    return _characterDatarource.getInfoCharacter(page: page);
  }
}
