part of 'top_rated_bloc.dart';

sealed class TopRatedAnimeEvent extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}

class OnTopAnimeFetchDataEvent extends TopRatedAnimeEvent {}
