import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/library/flutter_storages/app_secure_storage.dart';
import 'package:scan_me/library/flutter_storages/app_shared_preferences.dart';
import 'package:scan_me/ui/app/app_vm.dart';
import 'package:scan_me/ui/pages/dashboard/dashboard_page.dart';
import 'package:scan_me/ui/pages/dashboard/dashboard_vm.dart';
import 'package:scan_me/ui/pages/errors_pages/something_wrong_page.dart';
import 'package:scan_me/ui/pages/loading/loading_vm.dart';
import 'package:scan_me/ui/pages/tabs/files/files_page.dart';
import 'package:scan_me/ui/pages/tabs/files/files_vm.dart';
import 'package:scan_me/ui/pages/tabs/files/pages/internal/internal_page.dart';
import 'package:scan_me/ui/pages/tabs/files/pages/internal/internal_vm.dart';
import 'package:scan_me/ui/pages/tabs/profile/profile_page.dart';
import 'package:scan_me/ui/pages/tabs/main/main_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:scan_me/ui/app/app.dart';
import 'package:flutter/material.dart';
import 'package:dio/io.dart';
import 'package:scan_me/domain/config/app_config.dart';
import 'package:scan_me/domain/config/environment/environment.dart';
import 'package:scan_me/ui/pages/loading/loading_page.dart';

import '../ui/navigation/navigation.dart';
import '../ui/pages/tabs/settings/settings_page.dart';

part 'app_scope.dart';

part 'screen_factory.dart';

part 'widget_factory.dart';

part 'di_container.dart';

IAppFactory get makeAppFactory => _AppFactory();

final _diContainer = _DIContainer._instance;

late final IAppScope _appScope;

/// Зависимости приложения.
abstract interface class IAppScope {
  /// HTTP-клиент.
  Dio get dio;

  /// Навигация.
  AppRouter get router;

  /// Локльное хранилище
  IAppSharedPreferences get sharedPreferences;

  /// Защищенное локльное хранилище
  IAppSecureStorage get secureStorage;
}

abstract class IAppFactory {
  Widget makeApp();
}

class _AppFactory implements IAppFactory {
  _AppFactory() {
    _appScope = _AppScope._instance;
    // Раскоментировать после реализации
    // fireBaseInit();
  }

  Future<void> fireBaseInit() {
    throw UnimplementedError();
  }

  @override
  Widget makeApp() {
    return ChangeNotifierProvider(
      create: _diContainer._makeAppVM,
      child: App(
        config: _appScope.router.config(),
      ),
    );
  }
}
