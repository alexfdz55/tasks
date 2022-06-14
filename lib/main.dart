import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/repositories/repositories.dart';

import 'config/app_router.dart';
import 'screens/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [RepositoryProvider(create: (context) => LocalBDRepository())],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TaskBloc(
                bdRepository: RepositoryProvider.of<LocalBDRepository>(context))
              ..add(LoadTasks()),
          )
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Taskez',
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
