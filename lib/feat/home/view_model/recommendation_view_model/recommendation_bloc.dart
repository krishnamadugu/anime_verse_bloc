import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/random_suggestions/repos/random_suggestions_repo_provider.dart';
import '../../model/recommended_model/recommended_model.dart';

part 'recommendation_event.dart';
part 'recommendation_state.dart';

class RecommendedAnimeBloc
    extends Bloc<RecommendationAnimeEvent, RecommendationAnimeState> {
  final RandomSuggestionsRepoProvider randomSuggestionsRepoProvider;

  /// method calling based on events
  RecommendedAnimeBloc({
    required this.randomSuggestionsRepoProvider,
  }) : super(RecommendationAnimeState()) {
    on<OnFetchRecommendationAnimeEvent>(fetchRandomAnimeData);
  }

  void fetchRandomAnimeData(RecommendationAnimeEvent event,
      Emitter<RecommendationAnimeState> emit) async {
    /// emitting loading state
    emit(state.copyWith(
      status: RecommendationAnimeStatus.loading,
    ));
    try {
      final genres = await randomSuggestionsRepoProvider.onFetchTopRatedData(
          pageCountVal: 1);

      /// emitting success state
      emit(
        state.copyWith(
          status: RecommendationAnimeStatus.success,
          genres: genres.data,
        ),
      );
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(state.copyWith(
        status: RecommendationAnimeStatus.error,
      ));
    }
  }
}
