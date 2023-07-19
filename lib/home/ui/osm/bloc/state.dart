part of 'bloc.dart';

abstract class OsmState {}

class InitialOsmState extends OsmState {}

class LoadingOsmState extends OsmState {}

class DataOsmState extends OsmState {
  DataOsmState({required this.currentLatLng});
  final LatLng? currentLatLng;
}

class ErrorOsmState extends OsmState {
  ErrorOsmState({required this.error});
  final String error;
}
