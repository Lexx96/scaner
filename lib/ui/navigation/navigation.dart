import 'package:auto_route/auto_route.dart';
import 'package:scan_me/ui/navigation/navigation.gr.dart';

import 'routes/app_routes.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static final AppRouter _router = AppRouter._();
  static const _duration = 500;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: AppRootRoutes.empty.path,
          page: AppRootRoutes.empty.page,
          children: [
            CustomRoute(
              initial: true,
              path: AppRootRoutes.loading.path,
              page: AppRootRoutes.loading.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              durationInMilliseconds: _duration,
            ),
            CustomRoute(
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: AppRootRoutes.dashboard.path,
              page: AppRootRoutes.dashboard.page,
              children: [
                AutoRoute(
                  path: AppNestedRoutes.files.path,
                  page: AppNestedRoutes.files.page,
                ),
                AutoRoute(
                  path: AppNestedRoutes.main.path,
                  page: AppNestedRoutes.main.page,
                ),
                AutoRoute(
                  path: AppNestedRoutes.settings.path,
                  page: AppNestedRoutes.settings.page,
                ),
                AutoRoute(
                  path: AppNestedRoutes.profile.path,
                  page: AppNestedRoutes.profile.page,
                ),
              ],
            ),
            AutoRoute(
              path: AppNestedRoutes.iInternal.path,
              page: AppNestedRoutes.iInternal.page,
            ),
          ],
        ),
      ];

  List<PageRouteInfo> tabRoutes = const [
    IMainRoute(),
    IFilesRoute(),
    ISettingsRoute(),
    IProfileRoute(),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.material();

  AppRouter._();

  factory AppRouter.instance() => _router;
}
