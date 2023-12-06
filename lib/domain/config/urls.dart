
import 'package:scan_me/domain/config/app_config.dart';
import 'package:scan_me/domain/config/environment/environment.dart';

/// URL-адреса серверов.
abstract class Url {
  /// URL-адрес прокси-сервера.
  static String get prodProxyUrl => '';

  /// QA-адрес прокси-сервера.
  static String get qaProxyUrl => '';

  /// URL-адрес прокси-сервера разработки.
  static String get devProxyUrl => '';

  /// URL-адрес прокси-сервера продакшн.
  static String get prodWsUrl => '';

  /// URL-адрес Dev ws.
  static String get devWsUrl => '';

  /// Тестовый url.
  static String get testUrl => '';

  /// Продакшн url.
  static String get prodUrl => '';

  /// URL для разработки.
  static String get devUrl => '';

  /// Базовый url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}
