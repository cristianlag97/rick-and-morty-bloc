part of feature.rickandmorty.infraestructure.datasource;

class EpisodeDatasourceImpl extends EpisodeDatasource {
  @override
  Future<List<Result>> getAllEpisode({int page = 1}) async {
    final data = await GlobalGeneric.consumer<List<Result>>(
      page: page,
      queryType: 'all',
      url: '/episode/',
    );
    return data;
  }

  @override
  Future<List<Result>> getEpisodeByFilter({
    String filter = '',
    String query = '',
  }) async {
    final data = await GlobalGeneric.consumer<List<Result>>(
      filter: filter,
      query: query,
      queryType: 'filter',
      url: '/episode/',
    );
    return data;
  }

  @override
  Future<Result> getEpisodeById(String episodeId) async {
    final data = await GlobalGeneric.consumer<Result>(
      id: episodeId,
      url: '/episode/',
    );
    return data;
  }

  @override
  Future<Info> getInfoEpisode({int page = 1}) async {
    final data = await GlobalGeneric.consumer<Info>(
      page: page,
      url: '/episode/',
    );
    return data;
  }
}
