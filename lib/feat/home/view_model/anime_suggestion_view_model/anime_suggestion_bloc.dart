import 'package:anime_verse/feat/home/data/anime_suggestions/repo_provider/anime_suggestion_repo_provider.dart';
import 'package:anime_verse/feat/home/model/recommended_model/recommended_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'anime_suggestion_event.dart';
part 'anime_suggestion_state.dart';

class AnimeSuggestionBloc
    extends Bloc<AnimeSuggestionEvent, AnimeSuggestionState> {
  final AnimeSuggestionRepoProvider animeSuggestionRepoProvider;

  /// method calling based on events
  AnimeSuggestionBloc({
    required this.animeSuggestionRepoProvider,
  }) : super(AnimeSuggestionState()) {
    on<OnAnimeSuggestionsFetchDataEvent>(fetchGenreData);
  }

  void fetchGenreData(
      AnimeSuggestionEvent event, Emitter<AnimeSuggestionState> emit) async {
    /// emitting loading state
    emit(state.copyWith(
      status: AnimeSuggestionStatus.loading,
    ));
    try {
      final animeSuggestionList =
          await animeSuggestionRepoProvider.onFetchGenreData();

      /// emitting success state
      emit(
        state.copyWith(
          status: AnimeSuggestionStatus.success,
          animeSuggestionList: animeSuggestionList.data,
        ),
      );
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(state.copyWith(
        status: AnimeSuggestionStatus.error,
      ));
    }
  }
}
