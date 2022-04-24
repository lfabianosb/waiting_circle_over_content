part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

abstract class HomeState {
  final List<User> users;
  HomeState(this.users);
}

class HomeInitial extends HomeState {
  HomeInitial() : super([]);
}

class HomeLoading extends HomeState {
  HomeLoading(List<User> users) : super(users);
}

class HomeLoaded extends HomeState {
  HomeLoaded(List<User> users) : super(users);
}

class HomeError extends HomeState {
  final String message;

  HomeError(List<User> users, this.message) : super(users);
}
