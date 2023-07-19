part of 'bloc.dart';

abstract class GoogleState {}

class InitialGoogleState extends GoogleState {}

class LoadingGoogleState extends GoogleState {}

class DataGoogleState extends GoogleState {
  DataGoogleState({required this.currentLatLng});
  final LatLng? currentLatLng;
}

class ErrorGoogleState extends GoogleState {
  ErrorGoogleState({required this.error});
  final String error;
}
