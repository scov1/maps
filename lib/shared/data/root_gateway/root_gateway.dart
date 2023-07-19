import 'package:flutter_bloc/flutter_bloc.dart';

import 'gateway/gateway.dart';
import 'gateway/i_gateway.dart';
import 'gateway/states.dart';
import 'i_root_gateway.dart';

export 'i_root_gateway.dart';

class RootGateway extends Cubit<RootGatewayState> implements IRootGateway {
  RootGateway() : super(RootGatewayState()) {
    _updateGetways();
  }

  bool _isProduction = false;
  String _localeCode = '';
  late Gateway _prod;
  late Gateway _test;
  String _token = '';

  @override
  IGateway get gateway => _isProduction ? _prod : _test;

  @override
  set isProduction(bool? value) {
    if (value == null) return;
    _isProduction = value;
    _updateGetways();
  }

  @override
  set localeCode(String? value) {
    if (value == null) return;
    _localeCode = value;
    _updateGetways();
  }

  @override
  set token(String? value) {
    if (value == null) return;
    _token = value;
    _updateGetways();
  }

  void _updateGetways() {
    _prod = Gateway(
        localeCode: _localeCode,
        token: _token,
        uriGeneral: Uri(scheme: '', host: ''),
        onAuthError: (error) {
          emit(RootGatewayState(authError: error));
          emit(RootGatewayState());
        });
    _test = Gateway(
        localeCode: _localeCode,
        token: _token,
        uriGeneral: Uri(scheme: '', host: ''),
        onAuthError: (error) {
          emit(RootGatewayState(authError: error));
          emit(RootGatewayState());
        });
  }
}
