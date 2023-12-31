part of feature.rickandmorty.presentation.widgets.bottomshhet;

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key, required this.deleteFilter});

  final VoidCallback deleteFilter;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: ElevatedButton(
          onPressed: () {
            context.pop();
            deleteFilter();
          },
          child: const Text('remove filter')),
    );
  }
}
