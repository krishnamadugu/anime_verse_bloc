part of 'genre_bloc.dart';

enum GenreStatus { initial, success, error, loading, selected }

extension GenreStatusX on GenreStatus {
  bool get isInitial => this == GenreStatus.initial;
  bool get isSuccess => this == GenreStatus.success;
  bool get isError => this == GenreStatus.error;
  bool get isLoading => this == GenreStatus.loading;
  bool get isSelected => this == GenreStatus.selected;
}

class GenreState extends Equatable {
  const GenreState({
    this.status = GenreStatus.initial,
    List<GenreDatum>? genres,
    this.isSelected = 0,
  }) : genres = genres ?? const [];

  final List<GenreDatum> genres;
  final GenreStatus status;
  final int isSelected;

  @override
  List<Object?> get props => [status, genres, isSelected];

  GenreState copyWith({
    final List<GenreDatum>? genres,
    GenreStatus? status,
    int? isSelected,
  }) {
    return GenreState(
      genres: genres ?? this.genres,
      status: status ?? this.status,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
