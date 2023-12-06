part of 'app_factory.dart';

/// Фабрика data

/// Хранимые свойства именуются в формате:
/// _get(получение)
/// +
/// Home(название возвращаемого класса)
/// +
/// VM, Service, Provider (назничение класса)
///
/// Example: _getHomeVM

/// Объявление методов(не хранимых свойств)
///
/// методы именуются в формате:
/// _make(сделать)
/// +
/// Home(название возвращаемого класса)
/// +
/// VM, Service, Provider (назничение класса)
///
/// Example: _makeHomeVM

class _DIContainer {
  static final _DIContainer _instance = _DIContainer._();

  ///Тут объявляются хранимые свойства
  ///
  ///
  _DIContainer._() {
    ///Тут инициализируются хранимые свойства
    ///
    ///
  }

  /// app
  AppVM _makeAppVM(BuildContext context) => AppVM(
        AppState(),
        context: context,
      );

  ///loading
  LoadingVM _makeLoadingVM(BuildContext context) => LoadingVM(context);

  /// dashboard
  DashboardVM _makeDashboardVM(BuildContext context) => DashboardVM(
        DashboardState(),
        context: context,
      );

  ///files
  FilesVM _makeFilesVM(BuildContext context) => FilesVM(
        state: FilesVMState(),
        context: context,
      );

  /// internal
  InternalVM _makeInternalVM(int counter) => InternalVM(
        counter: counter,
        state: InternalState(),
      );
}
