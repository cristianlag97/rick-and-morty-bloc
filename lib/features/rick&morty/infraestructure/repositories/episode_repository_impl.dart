part of feature.rickandmorty.infraestructure.repositories;

class EpisodeRepositoryImpl extends EpisodeRepository {
  final EpisodeDatasource _episodeDatasource;

  EpisodeRepositoryImpl(this._episodeDatasource);

  @override
  Future<List<Result>> getAllEpisode({int page = 1}) {
    return _episodeDatasource.getAllEpisode(page: page);
  }

  @override
  Future<List<Result>> getEpisodeByFilter({
    String filter = '',
    String query = '',
  }) {
    return _episodeDatasource.getEpisodeByFilter(filter: filter, query: query);
  }

  @override
  Future<Result> getEpisodeById(String episodeId) {
    return _episodeDatasource.getEpisodeById(episodeId);
  }

  @override
  Future<Info> getInfoEpisode({int page = 1}) {
    return _episodeDatasource.getInfoEpisode(page: page);
  }
}
