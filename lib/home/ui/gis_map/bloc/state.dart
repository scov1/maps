part of 'bloc.dart';

abstract class GisState {}

class InitialGisState extends GisState {}

class LoadingGisState extends GisState {}

class DataGisState extends GisState {
  DataGisState({required this.currentLatLng});
  final LatLng? currentLatLng;
}

class ErrorGisState extends GisState {
  ErrorGisState({required this.error});
  final String error;
}
