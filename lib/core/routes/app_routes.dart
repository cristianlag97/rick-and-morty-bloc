part of core.routes;

final appRouter = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
        path: PAGES.splash.screenPath,
        name: PAGES.splash.screenName,
        builder: (context, state) => const CheckAuthStatusScreen(),
        redirect: (context, state) async {
          final isGoingTo = state.matchedLocation;
          final AuthStatus authStatus =
              context.watch<AuthBloc>().state.authStatus;
          if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
            return null;
          }
          if (authStatus == AuthStatus.notAuthenticated) {
            if (isGoingTo == '/login') return null;
            return '/login';
          }
          if (authStatus == AuthStatus.authenticated) {
            if (isGoingTo == '/login' || isGoingTo == '/splash') {
              return '/home/0';
            }
          }
          return null;
        }),
    GoRoute(
        path: PAGES.login.screenPath,
        name: PAGES.login.screenName,
        builder: (context, state) => const LoginScreen(),
        redirect: (context, state) async {
          final isGoingTo = state.matchedLocation;
          final AuthStatus authStatus =
              context.read<AuthBloc>().state.authStatus;

          if (authStatus == AuthStatus.authenticated) {
            if (isGoingTo == '/login' || isGoingTo == '/splash') {
              return '/home/0';
            }
          }
          if (authStatus == AuthStatus.notAuthenticated) {
            return '/login';
          }
          return null;
        }),
    GoRoute(
      path: PAGES.home.screenPath,
      name: PAGES.home.screenName,
      builder: (context, state) => const HomeScreen(),
      redirect: (context, state) async {
        final AuthStatus authStatus = context.read<AuthBloc>().state.authStatus;

        if (authStatus == AuthStatus.notAuthenticated) {
          return '/login';
        }
        return null;
      },
    ),
    GoRoute(
      path: PAGES.result.screenPath,
      name: PAGES.result.screenName,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? 'no-id';
        final provider = state.pathParameters['provider'] ?? 'no-provider';
        return DetailsScreen(
          resultId: id,
          provider: provider,
        );
      },
    ),
    GoRoute(
      path: PAGES.search.screenPath,
      name: PAGES.search.screenName,
      builder: (context, state) => const SearchScreen(),
    )
  ],
  errorBuilder: (context, state) => const NotFoundScreen(),
);
