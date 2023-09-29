part of features.rickandmorty.presentation.views;

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView>
    with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
    context.read<CharacterBloc>().handleLoadCharacters();
    context.read<CharacterBloc>().handleAddInfo();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final List<Result> characterState =
        context.watch<CharacterBloc>().state.results;
    final bool isLoading = context.watch<CharacterBloc>().state.isLoading;
    if (characterState.isEmpty || isLoading) {
      return const FullScreenLoading();
    }

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: px16,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ElevatedButton.icon(
                      onPressed: () {
                        context.push('/search');
                      },
                      icon: const Icon(Icons.search),
                      label: const Text('Buscar')),
                  ElevatedButton.icon(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) =>
                              const CharacterBottomSheet(),
                        );
                      },
                      icon: const Icon(Icons.list_rounded),
                      label: const Text('Filter'))
                ],
              ),
              gapy8,
              ListVertical(
                result: characterState,
                nameListView: 'character',
                loadLastPage: context.read<CharacterBloc>().handleAddInfo,
                loadResults: context.read<CharacterBloc>().handleLoadCharacters,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
