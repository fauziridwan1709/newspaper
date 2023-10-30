import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newspaper/core/bases/blocs/theme/theme_cubit.dart';
import 'package:newspaper/features/news/presentation/pages/_pages.dart';

import 'core/bases/blocs/l10n/l10n_cubit.dart';
import 'features/news/presentation/bloc/_bloc.dart';
import 'l10n/l10n.dart';

// final navState = Injector.getAsReactive<NavigationService>();
// NavigationService nav = navState.state;
// BuildContext? ctx = navState.state.navigatorKey.currentContext;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (_) => ThemeCubit()),
        BlocProvider<LocaleCubit>(create: (_) => LocaleCubit()),
        BlocProvider<SearchArticleBloc>(create: (_) => SearchArticleBloc()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (_, locale) {
          return BlocBuilder<ThemeCubit, ThemeData>(
            builder: (_, theme) {
              return MaterialApp(
                title: 'Flutter newspaper',
                locale: locale,
                debugShowCheckedModeBanner: false,
                // navigatorKey: nav.navigatorKey,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                theme: theme,
                initialRoute: '/home',
                routes: {
                  '/home': (context) => const NewsPage(),
                },
              );
            },
          );
        },
      ),
    );
  }
}
