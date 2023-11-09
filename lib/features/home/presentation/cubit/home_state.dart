class HomeState {}

final class HomeInitial extends HomeState {}

final class GetHistoricalPeriodsSuccess extends HomeState {}

final class GetHistoricalPeriodsFailure extends HomeState {
  final String errMessage;

  GetHistoricalPeriodsFailure({required this.errMessage});
}

final class GetHistoricalPeriodsLoading extends HomeState {}
