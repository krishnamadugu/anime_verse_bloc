part of 'recommendation_bloc.dart';

enum RecommendationAnimeStatus {
  initial,
  loading,
  success,
  failure,
  exception,
  error
}

extension RecommendationAnimeStatusX on RecommendationAnimeStatus {
  bool get isInitial => this == RecommendationAnimeStatus.initial;
  bool get isSuccess => this == RecommendationAnimeStatus.success;
  bool get isError => this == RecommendationAnimeStatus.error;
  bool get isLoading => this == RecommendationAnimeStatus.loading;
  bool get isException => this == RecommendationAnimeStatus.exception;
}

class RecommendationAnimeState extends Equatable {
  const RecommendationAnimeState({
    this.status = RecommendationAnimeStatus.initial,
    List<RecommendedAnimationDatum>? animeList,
  }) : animeList = animeList ?? const [];

  final List<RecommendedAnimationDatum> animeList;
  final RecommendationAnimeStatus status;

  @override
  List<Object?> get props => [status, animeList];

  RecommendationAnimeState copyWith({
    final List<RecommendedAnimationDatum>? genres,
    RecommendationAnimeStatus? status,
  }) {
    return RecommendationAnimeState(
      animeList: genres ?? animeList,
      status: status ?? this.status,
    );
  }
}
