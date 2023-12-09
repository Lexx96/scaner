import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/ui/pages/dashboard/dashboard_vm.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';
import 'widgets/app_floating_action_button.dart';
import 'widgets/src/data_tab_bar.dart';

class DashboardPage extends StatelessWidget {
  /// Виджет навигационного бара
  const DashboardPage({
    super.key,
    required this.tabRoutes,
  });

  /// Навигационные маршруты
  final List<PageRouteInfo> tabRoutes;

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final model = context.read<DashboardVM>();
    final currentIndex =
        context.select((DashboardVM value) => value.state.currentIndex);

    /// Items кнопок навигационного бара
    List<ItemTabData> items = [
      ItemTabData(
        label: s.main,
        icon: CupertinoIcons.house_fill,
      ),
      ItemTabData(
        label: s.files,
        icon: CupertinoIcons.folder,
      ),
      ItemTabData(
        label: s.settings,
        icon: CupertinoIcons.settings,
      ),
      ItemTabData(
        label: s.profile,
        icon: CupertinoIcons.profile_circled,
      ),
    ];

    return AutoTabsRouter(
      duration: Duration.zero,
      routes: tabRoutes,
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              tabsRouter.setActiveIndex(index);
              model.indexPage = index;
            },
            items: List.generate(
              items.length,
              (index) => BottomNavigationBarItem(
                label: items[index].label,
                icon: Icon(items[index].icon),
              ),
            ),
          ),
          floatingActionButton:
              currentIndex != 0 ? const AppFloatingActionButton() : null,
        );
      },
    );
  }
}
