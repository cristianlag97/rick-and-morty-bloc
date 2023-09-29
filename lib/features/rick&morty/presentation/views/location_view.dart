part of features.rickandmorty.presentation.views;

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();
}

class _LocationViewState extends State<LocationView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<LocationBloc>().handleAddInfo();
    context.read<LocationBloc>().handleLoadLocations();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final List<Result> locationsState =
        context.watch<LocationBloc>().state.results;
    final bool isLoading = context.watch<LocationBloc>().state.isLoading;
    if (locationsState.isEmpty || isLoading) {
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
                            const LocationBottomSheet(),
                      );
                    },
                    icon: const Icon(Icons.list_rounded),
                    label: const Text('Filter'))
              ],
            ),
            ListVertical(
              result: locationsState,
              loadLastPage: context.read<LocationBloc>().handleAddInfo,
              loadResults: context.read<LocationBloc>().handleLoadLocations,
              nameListView: 'location',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
