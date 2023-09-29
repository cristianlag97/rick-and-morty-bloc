part of feature.rickandmorty.presentation.widgets.bottomshhet;

class EpisodeBottomSheet extends StatelessWidget {
  const EpisodeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> seasion = ['01', '02', '03', '04', '05'];
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorTransparent,
      bottomNavigationBar: BottomNavigation(
        deleteFilter: () => context.read<EpisodeBloc>().handleDeleteFilter(),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height * 0.4,
        child: Padding(
          padding: p16,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: size30,
                    height: size4,
                    color: colorGreyLight,
                  ),
                ],
              ),
              gapx8,
              Text('Season', style: textStyle.titleSmall),
              Wrap(
                spacing: size8,
                children: seasion
                    .map((season) => ElevatedButton(
                        onPressed: () {
                          context.read<EpisodeBloc>().loadEpisodesFilter(
                                filter: 'episode',
                                query: 'S$season',
                              );
                          context.pop();
                        },
                        child: Text(season)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
