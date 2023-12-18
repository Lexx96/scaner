library scaffold_manager_tg;

import 'package:flutter/material.dart';
import 'package:scan_me/ui/common/app_progress_indicator.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

part 'src/scaffold_manager_data.dart';

part 'src/scaffold_manager_helper.dart';

/// Базовый виджет экрана
class ScaffoldManager extends StatelessWidget {
  /// Статус загрузки экрана
  final ScaffoldManagerStatus status;

  /// Виджет тела экрана
  final Widget body;

  /// backgroundColor
  final Color? backgroundColor;

  const ScaffoldManager({
    super.key,
    required this.status,
    required this.body,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: context.systemTopPadding,
          bottom: context.systemBottomPadding,
        ),
        child: _ScaffoldManagerHelper._getChild(status, body),
      ),
    );
  }
}
