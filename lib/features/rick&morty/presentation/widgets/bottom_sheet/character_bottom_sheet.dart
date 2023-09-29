part of feature.rickandmorty.presentation.widgets.bottomshhet;

class CharacterBottomSheet extends StatelessWidget {
  const CharacterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorTransparent,
      bottomNavigationBar: BottomNavigation(
        deleteFilter: () => context.read<CharacterBloc>().handleDeleteFilter(),
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
              Text('Gender', style: textStyle.titleSmall),
              Wrap(
                spacing: size8,
                children: Gender.values
                    .map((gender) => ElevatedButton(
                        onPressed: () {
                          context.read<CharacterBloc>().loadCharactersFilter(
                                filter: 'Gender',
                                query: gender.name,
                              );
                          context.pop();
                        },
                        child: Text(gender.name)))
                    .toList(),
              ),
              Text('Status', style: textStyle.titleSmall),
              Wrap(
                spacing: size8,
                children: Status.values
                    .map((status) => ElevatedButton(
                        onPressed: () {
                          context.read<CharacterBloc>().loadCharactersFilter(
                                filter: 'Status',
                                query: status.name,
                              );
                          context.pop();
                        },
                        child: Text(status.name)))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
