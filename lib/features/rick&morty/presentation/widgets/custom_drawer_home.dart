part of features.rickandmorty.presentation.widgets;

class CustomDrawerHome extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomDrawerHome({super.key, required this.scaffoldKey});

  @override
  State<CustomDrawerHome> createState() => _CustomDrawerHomeState();
}

class _CustomDrawerHomeState extends State<CustomDrawerHome> {
  int navDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    final textStyles = Theme.of(context).textTheme;

    return NavigationDrawer(
        elevation: 1,
        selectedIndex: navDrawerIndex,
        onDestinationSelected: (value) {
          setState(() {
            navDrawerIndex = value;
          });
          widget.scaffoldKey.currentState?.closeDrawer();
        },
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 16, 0),
            child: Text('Saludos', style: textStyles.titleMedium),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Otras opciones'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomFilledButton(
                onPressed: () {
                  context.read<AuthBloc>().logout();
                  context.read<NavigationBloc>().handleReset();
                },
                text: 'Cerrar sesión'),
          ),
        ]);
  }
}
