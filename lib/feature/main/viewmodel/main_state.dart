abstract class MainState {}

class MainInitial extends MainState {}

class MainLoading extends MainState {
  final bool isLoading;
  MainLoading(this.isLoading);
}

class MainCompleted extends MainState {}

class MainError extends MainState {}
