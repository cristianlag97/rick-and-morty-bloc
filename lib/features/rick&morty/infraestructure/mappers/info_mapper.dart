part of feature.rickandmorty.infraestructure.mappers;

class InfoMapper {
  static Info infojsonToEntity(ModelInfo info) => Info(
        count: info.count,
        next: info.next,
        pages: info.pages,
        prev: info.prev,
      );
}
