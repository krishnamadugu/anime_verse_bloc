import 'package:anime_verse/feat/home/data/genere/data_provider/genere_data_provider.dart';
import 'package:anime_verse/feat/home/data/genere/repos/genere_repo_provider.dart';
import 'package:anime_verse/feat/home/view_model/genre_view_model/genre_bloc.dart';
import 'package:anime_verse/feat/home/view_model/recommendation_view_model/recommendation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/route_config/route_handler.dart';
import 'config/theme_config/app_theme_config.dart';
import 'core/constants/app_constants/ui_constants/text_values.dart';
import 'core/utils/global_funcs/load_environment.dart';
import 'feat/home/data/random_suggestions/data_provider/random_suggestions_data_provider.dart';
import 'feat/home/data/random_suggestions/repos/random_suggestions_repo_provider.dart';
import 'feat/home/data/ranking/data_provider/ranking_data_provider.dart';
import 'feat/home/data/ranking/repos/ranking_repo_provider.dart';
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
        /// random suggestion repository provider
        RepositoryProvider<RandomSuggestionsRepoProvider>(
          create: (context) => RandomSuggestionsRepoProvider(
            randomSuggestionsDataProvider: RandomSuggestionsDataProvider(),
          ),
        ),

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
      ],
      child: MultiBlocProvider(
        providers: [
          /// creating recommendation bloc provider & adding fetch genre event
          BlocProvider<RecommendedAnimeBloc>(
            create: (BuildContext context) => RecommendedAnimeBloc(
              randomSuggestionsRepoProvider:
                  context.read<RandomSuggestionsRepoProvider>(),
            )..add(OnFetchRecommendationAnimeEvent()),
          ),

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
