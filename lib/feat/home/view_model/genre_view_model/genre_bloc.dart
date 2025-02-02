import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../data/genere/repos/genere_repo_provider.dart';
import '../../model/genre_model/genre_model.dart';

part 'genre_event.dart';
part 'genre_state.dart';

class GenreBloc extends Bloc<GenreEvent, GenreState> {
  final GenreRepoProvider genreRepoProvider;

  /// method calling based on events
  GenreBloc({
    required this.genreRepoProvider,
  }) : super(GenreState()) {
    on<OnGenreFetchDataEvent>(fetchGenreData);
  }

  void fetchGenreData(GenreEvent event, Emitter<GenreState> emit) async {
    /// emitting loading state
    emit(state.copyWith(
      status: GenreStatus.loading,
    ));
    try {
      final genres = await genreRepoProvider.onFetchGenreData();

      /// emitting success state
      emit(
        state.copyWith(
          status: GenreStatus.success,
          genres: genres.data,
        ),
      );
    } catch (error, stacktrace) {
      debugPrint(stacktrace.toString());

      /// emitting error state
      emit(state.copyWith(
        status: GenreStatus.error,
      ));
    }
  }
}
