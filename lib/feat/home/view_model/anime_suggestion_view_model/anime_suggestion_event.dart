part of 'anime_suggestion_bloc.dart';

sealed class AnimeSuggestionEvent extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class OnAnimeSuggestionsFetchDataEvent extends AnimeSuggestionEvent {}
