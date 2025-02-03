import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/ranking/repos/ranking_repo_provider.dart';
import '../../model/top_rated_model/top_rated_model.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedAnimeEvent, TopRatedState> {
  final RankingRepoProvider rankingRepoProvider;

  /// method calling based on events
  TopRatedBloc({required this.rankingRepoProvider}) : super(TopRatedState()) {
    on<OnTopAnimeFetchDataEvent>(fetchTopRatedAnimeData);
  }

  void fetchTopRatedAnimeData(
      TopRatedAnimeEvent event, Emitter<TopRatedState> emit) async {
    /// emitting loading state
    emit(state.copyWith(
      status: TopRatedAnimeStatus.loading,
    ));
    try {
      final ratedAnimeList = await rankingRepoProvider.onFetchTopRatedData();

      /// emitting success state
      emit(
        state.copyWith(
          status: TopRatedAnimeStatus.success,
          ratedAnimeList: ratedAnimeList.data,
        ),
      );
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(state.copyWith(
        status: TopRatedAnimeStatus.error,
      ));
    }
  }
}
