import 'package:flutter/material.dart';
import 'package:scan_me/library/status_bar_manager/status_bar_manager.dart';
import 'package:scan_me/ui/theme/app_colors.dart';
import 'package:scan_me/util/vm_utils.dart';

/// Состояние [DashboardVM]
class DashboardState {
  /// Index вбраного экрана
  final int currentIndex;

  DashboardState({
    this.currentIndex = 0,
  });

  DashboardState copyWith({
    int? currentIndex,
    bool? isShowBodyRoutes,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

/// Управление состоянием [DashboardPage]
class DashboardVM extends VMUtils<DashboardState> {
  /// Принимаемые параметры
  final BuildContext context;

  DashboardVM(
    DashboardState state, {
    required this.context,
  }) : super(state);

  /// Коллбак на изминения индекса авктивной вкладки
  set indexPage(int index) {
    notify(
      state.copyWith(currentIndex: index),
    );

    switch (index) {
      case 3:
        StatusBarManagerHelper.setStatusBarStyle(
          statusBarColor: AppColorsLight.white,
        );
      default:
        StatusBarManagerHelper.setStatusBarStyle(
          statusBarColor: AppColorsLight.white2,
        );
    }
  }
}
