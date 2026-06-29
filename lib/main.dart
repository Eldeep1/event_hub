import 'package:easy_localization/easy_localization.dart';
import 'package:event_hub/data/data_source/local/auth_local_data_source.dart';
import 'package:event_hub/data/data_source/local/saved_events_local_data_source.dart';
import 'package:event_hub/data/data_source/local/shared_preferences.dart';
import 'package:event_hub/data/data_source/remote/event_remote_data_source.dart';
import 'package:event_hub/data/repoisitory/auth_repo/auth_repo_imp.dart';
import 'package:event_hub/data/repoisitory/event_repo/event_repo_imp.dart';
import 'package:event_hub/data/repoisitory/saved_events_repo/saved_events_repo_imp.dart';
import 'package:event_hub/data/repoisitory/splash_repo/splash_repo_imp.dart';
import 'package:event_hub/domain/repository/auth_repo.dart';
import 'package:event_hub/domain/repository/event_repo.dart';
import 'package:event_hub/domain/repository/saved_events_repo.dart';
import 'package:event_hub/domain/repository/splash_repo.dart';
import 'package:event_hub/presentation/splash/view/splash_view.dart';
import 'package:event_hub/presentation/splash/view_model/cubit/splash_cubit.dart';
import 'package:event_hub/utils/routes/app_routes.dart';
import 'package:event_hub/utils/routes/router_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  final storage = SharedPreferencesStorage(prefs);

  final splashRepo = SplashRepoImp(preferences: storage);
  final eventRemoteDataSource = EventRemoteDataSource();
  final eventRepo = EventRepoImp(remoteDataSource: eventRemoteDataSource);
  final authLocalDataSource = await AuthLocalDataSource.getInstance();
  final authRepo = AuthRepoImp(localDataSource: authLocalDataSource);
  final savedEventsLocalDataSource =
      await SavedEventsLocalDataSource.getInstance();
  final savedEventsRepo = SavedEventsRepoImp(
    localDataSource: savedEventsLocalDataSource,
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      // startLocale: const Locale('ar'),
      child: MyApp(
        splashRepo: splashRepo,
        eventRepo: eventRepo,
        authRepo: authRepo,
        savedEventsRepo: savedEventsRepo,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final SplashRepo splashRepo;
  final EventRepository eventRepo;
  final AuthRepository authRepo;
  final SavedEventsRepository savedEventsRepo;

  const MyApp({
    super.key,
    required this.splashRepo,
    required this.eventRepo,
    required this.authRepo,
    required this.savedEventsRepo,
  });

  @override
  Widget build(BuildContext context) {
    const Color brandColor = Color(0xFF5669FF);
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SplashRepo>.value(value: splashRepo),
        RepositoryProvider<EventRepository>.value(value: eventRepo),
        RepositoryProvider<AuthRepository>.value(value: authRepo),
        RepositoryProvider<SavedEventsRepository>.value(value: savedEventsRepo),
      ],
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        initialRoute: AppRoutes.splashScreen,
        onGenerateRoute: RouterGenerator.generateRoute,
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
          child: SplashView(),
        ),
      ),
    );
  }
}
