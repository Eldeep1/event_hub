import 'package:event_hub/data/data_source/local/shared_preferences.dart';
import 'package:event_hub/data/repoisitory/splash_repo/splash_repo_imp.dart';
import 'package:event_hub/domain/repository/splash_repo/splash_repo.dart';
import 'package:event_hub/presentation/splash/view/splash_view.dart';
import 'package:event_hub/presentation/splash/view_model/cubit/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final storage = SharedPreferencesStorage(prefs);

  final splashRepo = SplashRepoImp(preferences: storage);

  runApp(MyApp(splashRepo: splashRepo));
}

class MyApp extends StatelessWidget {
  final SplashRepo splashRepo;

  const MyApp({super.key, required this.splashRepo});

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color(0xFF5669FF);
    return RepositoryProvider<SplashRepo>.value(
      value: splashRepo,
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: brandColor,
            primary: brandColor,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: BlocProvider(
          create: (_) => SplashCubit(splashRepo)..checkStartup(),
          child: const SplashView(),
        ),
      ),
    );
  }
}
