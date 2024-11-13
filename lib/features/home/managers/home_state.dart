part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitialState extends HomeState {}

/// Get All Drivers States
final class GetAllDriversLoadingModel extends HomeState {}

final class GetAllDriversSuccessModel extends HomeState {
  final String? message;

  GetAllDriversSuccessModel({this.message});
}

final class GetAllDriversErrorModel extends HomeState {
  final String? message;

  GetAllDriversErrorModel({this.message});
}

/// Get All Orders In All Garages States
class GetAllOrdersInAllGaragesLoadingState extends HomeState {}

class GetAllOrdersInAllGaragesSuccessState extends HomeState {
  final String? message;

  GetAllOrdersInAllGaragesSuccessState({this.message});
}

class GetAllOrdersInAllGaragesErrorState extends HomeState {
  final String? message;

  GetAllOrdersInAllGaragesErrorState({this.message});
}

/// Get Specific Order States
final class GetSpecificOrderLoadingState extends HomeState {}

final class GetSpecificOrderSuccessState extends HomeState {
  final String? message;

  GetSpecificOrderSuccessState({this.message});
}

final class GetSpecificOrderErrorState extends HomeState {
  final String? message;

  GetSpecificOrderErrorState({this.message});
}

/// Get Attendance In Start States
final class GetAttendanceInStartLoadingState extends HomeState {}

final class GetAttendanceInStartSuccessState extends HomeState {
  final String? message;

  GetAttendanceInStartSuccessState({this.message});
}

final class GetAttendanceInStartErrorState extends HomeState {
  final String? message;

  GetAttendanceInStartErrorState({this.message});
}