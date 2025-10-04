part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
final class PharmacyLoadingState extends HomeState {}
final class PharmacySuccessState extends HomeState {}
final class PharmacyErrorState extends HomeState {
  final String error;
  PharmacyErrorState(this.error);
}
