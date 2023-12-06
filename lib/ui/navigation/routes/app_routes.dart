import 'package:auto_route/auto_route.dart';

import '../navigation.gr.dart';

/// Корневые навигационные роуты приложения
abstract class AppRootRoutes{
  static const empty = AppRouteModel(path: '/empty', name: EmptyRouter.name, page: EmptyRouter.page),
      loading = AppRouteModel(path: 'loading', name: ILoadingRoute.name, page: ILoadingRoute.page),
      somethingWrong = AppRouteModel(path: 'something_wrong', name: ISomethingWrongRoute.name, page: ISomethingWrongRoute.page),
  dashboard = AppRouteModel(path: 'dashboard', name: IDashboardRoute.name, page: IDashboardRoute.page);
}

/// Вложенные навигационные роуты приложения
abstract class AppNestedRoutes{
  static const files = AppRouteModel(path: 'files', name: IFilesRoute.name, page: IFilesRoute.page),
      iInternal = AppRouteModel(path: 'iInternal', name: IInternalRoute.name, page: IInternalRoute.page),
  main = AppRouteModel(path: 'main', name: IMainRoute.name, page: IMainRoute.page),
  settings = AppRouteModel(path: 'settings', name: ISettingsRoute.name, page: ISettingsRoute.page),
  profile = AppRouteModel(path: 'profile', name: IProfileRoute.name, page: IProfileRoute.page);
}

/// Модель описания роута
class AppRouteModel {
  final String path;
  final String name;
  final PageInfo page;

 const AppRouteModel({
    required this.path,
    required this.name,
   required this.page,
 });
}
