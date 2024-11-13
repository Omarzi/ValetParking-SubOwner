part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

/// Get Profile Data State
final class GetProfileDataLoadingState extends ProfileState {}

final class GetProfileDataSuccessState extends ProfileState {}

final class GetProfileDataErrorState extends ProfileState {
  final String? message;

  GetProfileDataErrorState({this.message});
}