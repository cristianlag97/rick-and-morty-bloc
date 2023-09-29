part of feature.rickandmorty.infraestructure.models;

class ModelRickAndMorty {
  final ModelInfo info;
  final List<ModelResult> results;

  ModelRickAndMorty({
    required this.info,
    required this.results,
  });

  ModelRickAndMorty.fromJson(Map<String, dynamic> json)
      : info = ModelInfo.fromJson(json["info"]),
        results = List<ModelResult>.from(
            json["results"].map((x) => ModelResult.fromJson(x)));
}
