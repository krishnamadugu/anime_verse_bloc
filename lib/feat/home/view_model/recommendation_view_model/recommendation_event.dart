part of 'recommendation_bloc.dart';

sealed class RecommendationAnimeEvent extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class OnFetchRecommendationAnimeEvent extends RecommendationAnimeEvent {}
