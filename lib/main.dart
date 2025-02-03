import 'package:anime_verse/feat/home/data/anime_suggestions/data_provider/anime_suggestion_data_provider.dart';
import 'package:anime_verse/feat/home/data/anime_suggestions/repo_provider/anime_suggestion_repo_provider.dart';
import 'package:anime_verse/feat/home/view_model/anime_suggestion_view_model/anime_suggestion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/route_config/route_handler.dart';
import 'config/theme_config/app_theme_config.dart';
import 'core/constants/app_constants/ui_constants/text_values.dart';
import 'core/utils/global_funcs/load_environment.dart';
import 'feat/home/data/genere/data_provider/genere_data_provider.dart';
import 'feat/home/data/genere/repos/genere_repo_provider.dart';
import 'feat/home/data/ranking/data_provider/ranking_data_provider.dart';
import 'feat/home/data/ranking/repos/ranking_repo_provider.dart';
import 'feat/home/view_model/genre_view_model/genre_bloc.dart';
import 'feat/home/view_model/top_rated_view_model/top_rated_bloc.dart';

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
        /// top rated anime repository provider
        RepositoryProvider<RankingRepoProvider>(
          create: (context) => RankingRepoProvider(
            rankingDataProvider: RankingDataProvider(),
          ),
        ),

        /// genre repository provider
        RepositoryProvider<GenreRepoProvider>(
          create: (context) => GenreRepoProvider(
            genreDataProvider: GenreDataProvider(),
          ),
        ),

        /// anime suggestion repository provider
        RepositoryProvider<AnimeSuggestionRepoProvider>(
          create: (context) => AnimeSuggestionRepoProvider(
            animeSuggestionDataProvider: AnimeSuggestionDataProvider(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          /// creating ranking bloc provider & adding fetch ranking event
          BlocProvider<TopRatedBloc>(
            create: (BuildContext context) => TopRatedBloc(
              rankingRepoProvider: context.read<RankingRepoProvider>(),
            )..add(OnTopAnimeFetchDataEvent()),
          ),

          /// creating genre bloc provider & adding fetch genre event
          BlocProvider<GenreBloc>(
            create: (BuildContext context) => GenreBloc(
              genreRepoProvider: context.read<GenreRepoProvider>(),
            )..add(OnGenreFetchDataEvent()),
          ),

          /// creating anime suggestion bloc provider & adding fetch anime suggestion event
          BlocProvider<AnimeSuggestionBloc>(
            create: (BuildContext context) => AnimeSuggestionBloc(
              animeSuggestionRepoProvider:
                  context.read<AnimeSuggestionRepoProvider>(),
            )..add(OnAnimeSuggestionsFetchDataEvent()),
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
