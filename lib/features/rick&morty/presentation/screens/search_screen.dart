part of features.rickandmorty.presentation.screen;

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTransparent,
      ),
      body: const _BodySearch(),
    );
  }
}

class _BodySearch extends StatelessWidget {
  const _BodySearch();

  @override
  Widget build(BuildContext context) {
    final searchState = context.watch<SearchBloc>().state;
    final textStyle = Theme.of(context).textTheme;

    return SafeArea(
        child: Column(
      children: <Widget>[
        Padding(
          padding: px16,
          child: CustomTextFormField(
            prefixIcon: const Icon(Icons.search),
            onChanged: context.read<SearchBloc>().loadSearchResult,
            hint: 'Buscar...',
          ),
        ),
        searchState.characters.isNotEmpty
            ? Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: searchState.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final characters = searchState.characters;
                      return ListTile(
                        onTap: () => context
                            .push('/result/${characters[index].id}/character'),
                        leading: Hero(
                          tag: 'tag-imageProfile-${characters[index].name}',
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage(characters[index].image),
                          ),
                        ),
                        title: Text(characters[index].name),
                      );
                    }),
              )
            : Expanded(
                child: Padding(
                  padding: px16,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Icon(
                        Icons.no_accounts_outlined,
                        size: 100,
                        color: colorGray,
                      ),
                      Text(
                        'No hay characters por mostrar',
                        style:
                            textStyle.titleMedium!.copyWith(color: colorGray),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              )
      ],
    ));
  }
}
