part of 'genre_bloc.dart';

sealed class GenreEvent extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class OnGenreFetchDataEvent extends GenreEvent {}

class OnGenreSelectedEvent extends GenreEvent {
  final int selectedId;
  OnGenreSelectedEvent({
    required this.selectedId,
  });

  @override
  List<Object> get props => [selectedId];
}
