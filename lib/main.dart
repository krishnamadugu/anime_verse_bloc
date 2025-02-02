import 'package:anime_verse/feat/home/data/genere/data_provider/genere_data_provider.dart';
import 'package:anime_verse/feat/home/data/genere/repos/genere_repo_provider.dart';
import 'package:anime_verse/feat/home/view_model/genre_view_model/genre_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/route_config/route_handler.dart';
import 'config/theme_config/app_theme_config.dart';
import 'core/constants/app_constants/ui_constants/text_values.dart';
import 'core/utils/global_funcs/load_environment.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// loading env file & its variables
  await dotenv.load(fileName: "env_keys.env");
  loadAppEnvironment();

  /// running app commands
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        /// genre repository provider
        RepositoryProvider<GenreRepoProvider>(
          create: (context) => GenreRepoProvider(
            genreDataProvider: GenreDataProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          /// creating genre bloc provider & adding fetch genre event
          BlocProvider<GenreBloc>(
            create: (BuildContext context) => GenreBloc(
              genreRepoProvider: context.read<GenreRepoProvider>(),
            )..add(OnGenreFetchDataEvent()),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,

          /// theme and title properties
          title: AppTexts.kAppTitle,
          theme: AppThemeConfig.lightTheme,
          darkTheme: AppThemeConfig.darkTheme,

          /// router properties
          routerConfig: RouteHandler.router,
        ),
      ),
    );
  }
}
