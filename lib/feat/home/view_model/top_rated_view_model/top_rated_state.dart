part of 'top_rated_bloc.dart';

enum TopRatedAnimeStatus {
  loading,
  initial,
  success,
  failure,
  error,
  exception
}

extension TopRatedAnimeStatusX on TopRatedAnimeStatus {
  bool get isInitial => this == TopRatedAnimeStatus.initial;
  bool get isSuccess => this == TopRatedAnimeStatus.success;
  bool get isError => this == TopRatedAnimeStatus.error;
  bool get isException => this == TopRatedAnimeStatus.exception;
  bool get isLoading => this == TopRatedAnimeStatus.loading;
}

class TopRatedState extends Equatable {
  final List<TopRatedAnimeDatum>? ratedAnimeList;
  final TopRatedAnimeStatus? status;

  const TopRatedState({
    this.status = TopRatedAnimeStatus.initial,
    List<TopRatedAnimeDatum>? ratedAnimeList,
  }) : ratedAnimeList = ratedAnimeList ?? const [];

  TopRatedState copyWith({
    final List<TopRatedAnimeDatum>? ratedAnimeList,
    TopRatedAnimeStatus? status,
  }) {
    return TopRatedState(
      ratedAnimeList: ratedAnimeList ?? this.ratedAnimeList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, ratedAnimeList];
}
