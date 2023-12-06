part of 'app_factory.dart';

/// Фабрика экранов

/// Каждый класс текущего файла именуется в формате:
/// I(интеррфейс)
/// +
/// HomePage(название возвращаемого виджета)
///
/// Помечается аннотацией [@RoutePage()]
///
/// И служит для возможности внедрения зависимостей
/// Example: IHomePage

@RoutePage()
class IDashboardPage implements AutoRouteWrapper {
  const IDashboardPage();

  @override
  Widget wrappedRoute(_) {
    return ChangeNotifierProvider(
      create: _diContainer._makeDashboardVM,
      child: DashboardPage(
        tabRoutes: _appScope.router.tabRoutes,
      ),
    );
  }
}

@RoutePage()
class ILoadingPage implements AutoRouteWrapper {
  const ILoadingPage();

  @override
  Widget wrappedRoute(_) {
    return Provider(
      create: _diContainer._makeLoadingVM,
      child: const LoadingPage(),
    );
  }
}

@RoutePage()
class ISomethingWrongPage implements AutoRouteWrapper {
  const ISomethingWrongPage(this.msg);

  final String msg;

  @override
  Widget wrappedRoute(_) {
    return SomethingWrongPage(msg: msg);
  }
}

@RoutePage()
class IFilesPage implements AutoRouteWrapper {
  const IFilesPage();

  @override
  Widget wrappedRoute(_) {
    return WidgetFactory.files();
  }
}

@RoutePage()
class IMainPage implements AutoRouteWrapper {
  const IMainPage();

  @override
  Widget wrappedRoute(_) {
    return WidgetFactory.main();
  }
}

@RoutePage()
class ISettingsPage implements AutoRouteWrapper {
  const ISettingsPage();

  @override
  Widget wrappedRoute(_) {
    return WidgetFactory.settings();
  }
}

@RoutePage()
class IProfilePage implements AutoRouteWrapper {
  const IProfilePage();

  @override
  Widget wrappedRoute(_) {
    return WidgetFactory.profile();
  }
}

@RoutePage()
class IInternalPage implements AutoRouteWrapper {
  const IInternalPage({required this.counter});

  final int counter;

  @override
  Widget wrappedRoute(_) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => _diContainer._makeInternalVM(counter),
      child: const InternalPage(),
    );
  }
}
