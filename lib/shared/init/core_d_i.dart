import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../home/ui/gis_map/bloc/bloc.dart';
import '../../home/ui/google_map/bloc/bloc.dart';
import '../../home/ui/osm/bloc/bloc.dart';
import '../../root/controller/primary_tabs_controller.dart';
import '../data/root_gateway/root_gateway.dart';
import '../l10n/locale_repo.dart';
import '../l10n/source/local_storage.dart';
import '../secure_storage.dart';
import '../theme/repo/theme_repo.dart';

class CoreDi {
  static GetIt get = GetIt.asNewInstance();

  static void register() {
    get.registerSingletonAsync(() => LocalStorage.instance);

    get.registerSingleton(
      SecureStorage(
        const FlutterSecureStorage(
          aOptions: AndroidOptions(
            encryptedSharedPreferences: true,
          ),
        ),
      ),
    );
    get.registerSingleton(ThemeRepo());
    get.registerSingleton(LocaleRepo());
    get.registerSingleton(PrimaryTabsController(initial: 0));

    get.registerSingleton<RootGateway>(
      RootGateway(),
    );
    get.registerLazySingleton(() => GoogleBloc());
    get.registerLazySingleton(() => OsmBloc());
    get.registerLazySingleton(() => GisBloc());
  }

//read data which is NOT accessible without auth
  static Future<void> initProtected() async {}

//read data which IS accessible without auth
  static Future<void> initUnprotected() async {}
}
