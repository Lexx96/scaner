import 'package:scan_me/domain/config/app_config.dart';
import 'package:scan_me/domain/config/debug_options.dart';
import 'package:scan_me/domain/config/environment/build_types.dart';
import 'package:scan_me/domain/config/environment/environment.dart';
import 'package:scan_me/domain/config/urls.dart';
import 'package:scan_me/runner.dart';

/// Точка входа в приложение в режиме отладки.
void main() {
  Environment.init(
    buildType: BuildType.debug,
    config: AppConfig(
      url: Url.testUrl,
      wsUrl: Url.devWsUrl,
      proxyUrl: Url.devProxyUrl,
      debugOptions: DebugOptions(
        debugShowCheckedModeBanner: true,
      ),
    ),
  );

  run();
}
