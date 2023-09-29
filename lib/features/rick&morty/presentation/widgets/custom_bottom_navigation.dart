part of features.rickandmorty.presentation.widgets;

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({required this.currentIndex, super.key});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return BottomNavigationBar(
        onTap: (int index) =>
            context.read<NavigationBloc>().handleCurrentPage(context, index),
        elevation: 0,
        currentIndex: currentIndex,
        selectedItemColor: colors.primary,
        unselectedItemColor: colors.primary.withOpacity(0.3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Character',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: 'Episode',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Location',
          ),
        ]);
  }
}
