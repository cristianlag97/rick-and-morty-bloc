part of features.rickandmorty.domain.datasource;

abstract class CharacterDatasource {
  Future<Info> getInfoCharacter({int page = 1});
  Future<List<Result>> getAllCharacter({int page = 1});
  Future<List<Result>> getCharacterByFilter({String filter, String query});
  Future<List<Result>> getCharacterBySearch(String filter);
  Future<Result> getCharacterById(String characterId);
}
