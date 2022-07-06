abstract class WorldTimeState {}

class WorldTimeInitial extends WorldTimeState {}

class WorldTimeLoading extends WorldTimeState {
  final bool isLoading;
  WorldTimeLoading(this.isLoading);
}

class WorldTimeCompleted extends WorldTimeState {}

class WorldTimeError extends WorldTimeState {}
