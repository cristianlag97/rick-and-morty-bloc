part of features.rickandmorty.presentation.views;

class EpisodeView extends StatefulWidget {
  const EpisodeView({super.key});

  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends State<EpisodeView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<EpisodeBloc>().handleAddInfo();
    context.read<EpisodeBloc>().handleLoadEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Result> episodeState =
        context.watch<EpisodeBloc>().state.results;
    final bool isLoading = context.read<EpisodeBloc>().state.isLoading;
    if (episodeState.isEmpty || isLoading) {
      return const FullScreenLoading();
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: px16,
        child: Column(
          children: <Widget>[
            gapy16,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) =>
                            const EpisodeBottomSheet(),
                      );
                    },
                    icon: const Icon(Icons.list_rounded),
                    label: const Text('Filter'))
              ],
            ),
            ListVertical(
              result: episodeState,
              nameListView: 'episode',
              loadLastPage: context.read<EpisodeBloc>().handleAddInfo,
              loadResults: context.read<EpisodeBloc>().handleLoadEpisodes,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
