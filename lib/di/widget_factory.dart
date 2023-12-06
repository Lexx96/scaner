part of 'app_factory.dart';

/// Фабрика виджетов

/// Каждый метод класса [WidgetFactory] именуется в формате:
/// homePage(название возвращаемого виджета в lowerCamelCase)
///
/// Example: homePage

abstract class WidgetFactory {

  static Widget files() {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _diContainer._makeFilesVM(context),
      child: const FilesPage(),
    );
  }

  static Widget main() {
    return const MainPage();
  }

  static Widget settings() {
    return const SettingsPage();
  }

  static Widget profile() {
    return const ProfilePage();
  }
}