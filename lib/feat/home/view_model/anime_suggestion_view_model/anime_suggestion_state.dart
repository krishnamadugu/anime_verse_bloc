part of 'anime_suggestion_bloc.dart';

enum AnimeSuggestionStatus { initial, success, error, loading, selected }

extension AnimeSuggestionStatusX on AnimeSuggestionStatus {
  bool get isInitial => this == AnimeSuggestionStatus.initial;
  bool get isSuccess => this == AnimeSuggestionStatus.success;
  bool get isError => this == AnimeSuggestionStatus.error;
  bool get isLoading => this == AnimeSuggestionStatus.loading;
  bool get isSelected => this == AnimeSuggestionStatus.selected;
}

class AnimeSuggestionState extends Equatable {
  const AnimeSuggestionState({
    this.status = AnimeSuggestionStatus.initial,
    List<RecommendedAnimationDatum>? animeSuggestionList,
  }) : animeSuggestionList = animeSuggestionList ?? const [];

  final List<RecommendedAnimationDatum> animeSuggestionList;
  final AnimeSuggestionStatus status;

  @override
  List<Object?> get props => [status, animeSuggestionList];

  AnimeSuggestionState copyWith({
    final List<RecommendedAnimationDatum>? animeSuggestionList,
    AnimeSuggestionStatus? status,
  }) {
    return AnimeSuggestionState(
      animeSuggestionList: animeSuggestionList ?? this.animeSuggestionList,
      status: status ?? this.status,
    );
  }
}
