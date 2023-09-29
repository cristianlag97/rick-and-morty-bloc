part of features.rickandmorty.domain.datasource;

abstract class EpisodeDatasource {
  Future<Info> getInfoEpisode({int page = 1});
  Future<List<Result>> getAllEpisode({int page = 1});
  Future<List<Result>> getEpisodeByFilter({String filter, String query});
  Future<Result> getEpisodeById(String episodeId);
}
