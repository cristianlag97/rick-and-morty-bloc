part of features.rickandmorty.presentation.screen;

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageController = PageController(keepPage: true);
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final viewRoutes = <Widget>[
    const HomeView(),
    const CharacterView(),
    const EpisodeView(),
    const LocationView()
  ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final int currentPage = context.watch<NavigationBloc>().state.currentPage;
    final textStyle = Theme.of(context).textTheme;

    if (pageController.hasClients) {
      pageController.animateToPage(
        currentPage,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
      );
      pageController.initialPage;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorTransparent,
        title: Text(
          'Rick and Morty',
          style: textStyle.titleSmall!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      drawer: CustomDrawerHome(scaffoldKey: scaffoldKey),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex: currentPage),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
