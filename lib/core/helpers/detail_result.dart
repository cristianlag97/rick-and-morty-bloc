part of core.helpers;

Future<void> detailResultRead({
  required BuildContext context,
  required String detail,
  required String id,
}) async {
  switch (detail) {
    case 'episode':
      return context.read<EpisodeBloc>().handleLoadEpisodeId(id);

    case 'location':
      return context.read<LocationBloc>().handleLoadLocationId(id);

    case 'character':
    default:
      return context.read<CharacterBloc>().handleLoadCharacterId(id);
  }
}

Map<String, Result>? detailResultWatch({
  required BuildContext context,
  required String detail,
  required String id,
}) {
  switch (detail) {
    case 'episode':
      final data = context.watch<EpisodeBloc>().state.resultsMap;
      return data;
    case 'location':
      final data = context.watch<LocationBloc>().state.resultsMap;
      return data;
    case 'character':
    default:
      final data = context.watch<CharacterBloc>().state.resultsMap;
      return data;
  }
}
