part of feature.rickandmorty.presentation.widgets.bottomshhet;

class LocationBottomSheet extends StatelessWidget {
  const LocationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> types = [
      'planet',
      'space station',
      'microverse',
      'tv',
      'fantasy town'
    ];
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorTransparent,
      bottomNavigationBar: BottomNavigation(
        deleteFilter: () => context.read<LocationBloc>().handleDeleteFilter(),
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
              Text('Types', style: textStyle.titleSmall),
              Wrap(
                spacing: size8,
                children: types
                    .map((type) => ElevatedButton(
                        onPressed: () {
                          context.read<LocationBloc>().loadLocationsFilter(
                                filter: 'type',
                                query: type,
                              );
                          context.pop();
                        },
                        child: Text(type)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
