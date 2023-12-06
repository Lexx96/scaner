import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/theme/app_theme.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/library/status_bar_manager.dart';

typedef AppUIBuilder = Function(ThemeData, ThemeData);

class AppUISettings extends StatelessWidget {
  /// Настройка UI всего приложения
  const AppUISettings({
    super.key,
    required this.adaptiveState,
    required this.builder,
  });

  /// Состояние [Adaptive]
  final AdaptiveState adaptiveState;

  /// Дочерний виджет, обычно [MaterialApp] или [CupertinoApp]
  final AppUIBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Adaptive(
      state: adaptiveState,
      builder: (context) {
        return AdaptiveTheme(
          light: AppTheme.light,
          dark: AppTheme.dark,
          initial: AppTheme.getResultThemeMode,
          builder: (ThemeData light, ThemeData dark) {
            return OverlaySupport.global(
              child: StatusBarManager(
                translucent: false,
                statusBarColor: context.theme.scaffoldBackgroundColor,
                lightNavigationBarColor: context.theme.scaffoldBackgroundColor,
                theme: CurrentTheme.light,
                child: builder(light, dark),
              ),
            );
          },
        );
      },
    );
  }
}
