part of 'home_screen_bloc.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();
}

class HomeScreenInitial extends HomeScreenState {
  @override
  List<Object> get props => [];
}

class HomeScreenLoadingState extends HomeScreenState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeScreenLoadedState extends HomeScreenState {
  final List<User> albums;
  HomeScreenLoadedState({required this.albums});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class HomeScreenError extends HomeScreenState {
  final error;
  HomeScreenError({this.error});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
