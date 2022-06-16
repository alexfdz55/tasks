import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/blocs/blocs.dart';
import 'package:tasks/cubits/cubits.dart';
import 'package:tasks/models/models.dart';
import 'package:tasks/repositories/repositories.dart';
import 'config/app_router.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskAdapter());

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
          BlocProvider(create: (context) => BottomNavCubit()),
          BlocProvider(
            create: (context) => TaskBloc(
                bdRepository: RepositoryProvider.of<LocalBDRepository>(context))
              ..add(LoadTasks()),
          ),
          BlocProvider(create: (context) => TaskTabsCubit()),
          BlocProvider(create: (context) => SearchTaskBloc()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Taskez',
          themeMode: ThemeMode.dark,
          theme: ThemeData(
            brightness: Brightness.light,
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
            // dialogTheme: DialogTheme(
            //   backgroundColor: HexColor.fromHex("#181a1f"),
            // ),
          ),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: SplashScreen.routeName,
        ),
      ),
    );
  }
}
