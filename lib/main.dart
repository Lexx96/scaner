import 'package:scan_me/domain/config/app_config.dart';
import 'package:scan_me/domain/config/debug_options.dart';
import 'package:scan_me/domain/config/environment/build_types.dart';
import 'package:scan_me/domain/config/environment/environment.dart';
import 'package:scan_me/domain/config/urls.dart';
import 'package:scan_me/runner.dart';
//dart pub global run intl_utils:generate
/// Точка входа в приложение в режиме релиза.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
      wsUrl: Url.prodWsUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
