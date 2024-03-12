part of 'main_cubit.dart';

sealed class MainState extends Equatable {
  const MainState();

  @override
  List<Object> get props => [];
}

final class MainInitial extends MainState {
  const MainInitial();
}

final class MainLoading extends MainState {
  const MainLoading();
}

final class MainLoggedOut extends MainState {
  const MainLoggedOut();
}

final class MainError extends MainState {
  const MainError({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
