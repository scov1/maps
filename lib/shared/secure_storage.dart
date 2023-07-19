import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  SecureStorage(this._storage);

  final FlutterSecureStorage _storage;

  Future<String?> read(String key) async {
    return _storage.read(key: key);
  }

  Future<void> delete(String key) async {
    return _storage.delete(key: key);
  }

  Future<void> write(String key, String value) async {
    return _storage.write(
      key: key,
      value: value,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SecureStorage && other._storage == _storage;
  }

  @override
  int get hashCode => _storage.hashCode;
}
