import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states/theme_bloc.dart';
import 'utils/router_generator.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return const ApplicationWithTheme();
  }
}

class ApplicationWithTheme extends StatelessWidget {
  const ApplicationWithTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: "Carnet de Sante",
            theme: theme,
            debugShowCheckedModeBanner: false,
            initialRoute: RouterGenerator.splashRoute,
            navigatorObservers: [routeObserver],
            onGenerateRoute: (RouteSettings setting) {
              return RouterGenerator.navigate(setting);
            },
          );
        },
      ),
    );
  }
}
