import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'core/core.dart';
import 'core/routes/routes.dart';
import 'features/auth/presentation/bloc/bloc.dart';
import 'features/rick&morty/presentation/bloc/bloc.dart';

void main() {
  Injections.setupLocator();
  AuthInjections.setupLocatorAuth();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
          create: (_) => AuthInjections.locator.get<AuthBloc>(), lazy: false),
      BlocProvider(create: (_) => AuthInjections.locator.get<LoginFormBloc>()),
      BlocProvider(create: (_) => Injections.locator.get<NavigationBloc>()),
      BlocProvider(create: (_) => Injections.locator.get<CharacterBloc>()),
      BlocProvider(create: (_) => Injections.locator.get<EpisodeBloc>()),
      BlocProvider(create: (_) => Injections.locator.get<LocationBloc>()),
      BlocProvider(create: (_) => Injections.locator.get<SearchBloc>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
