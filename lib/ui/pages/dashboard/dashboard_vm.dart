import 'package:flutter/material.dart';
import 'package:scan_me/util/vm_utils.dart';

/// Состояние [DashboardVM]
class DashboardState {
  /// Index вбраного экрана
  final int currentIndex;

  /// Использовать ли виджет [BodyRoutesTabBar]
  /// для реализации вкладок
  final bool isShowBodyRoutes;

  DashboardState({
    this.isShowBodyRoutes = false,
    this.currentIndex = 0,
  });

  DashboardState copyWith({
    int? currentIndex,
    bool? isShowBodyRoutes,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
      isShowBodyRoutes: isShowBodyRoutes ?? this.isShowBodyRoutes,
    );
  }
}

/// Управление состоянием [DashboardPage]
class DashboardVM extends VMUtils<DashboardState> {

  late TabController tabController;

  /// Принимаемые параметры
  final BuildContext context;

  DashboardVM(
    DashboardState state, {
    required this.context,
  }) : super(state);

  @override
  void init() {

    super.init();
  }

  /// Коллбак на изминения индекса авктивной вкладки
  set indexPage(int index) {
    notify(
      state.copyWith(currentIndex: index),
    );

    tabController.animateTo(index, duration: Duration.zero);
  }

  /// Изменить тип вкладок: [BodyRoutesTabBar] || [BodyWithTabBar]
  void changeType() {
    notify(
      state.copyWith(isShowBodyRoutes: !state.isShowBodyRoutes),
    );
  }

  @override
  void close() {
    tabController.dispose();
    super.close();
  }
}
