part of feature.rickandmorty.infraestructure.mappers;

class LocationMapper {
  static LocationData locationjsonToEntity(ModelLocation location) =>
      LocationData(name: location.name, url: location.url);
}
