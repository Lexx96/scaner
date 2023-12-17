library scaffold_manager_tg;

import 'package:flutter/material.dart';
import 'package:scan_me/ui/common/app_progress_indicator.dart';

part 'src/scaffold_manager_data.dart';

part 'src/scaffold_manager_helper.dart';

/// Базовый виджет экрана
class ScaffoldManager extends StatelessWidget {
  /// Статус загрузки экрана
  final ScaffoldManagerStatus status;

  /// Виджет тела экрана
  final Widget body;

  const ScaffoldManager({
    super.key,
    required this.status,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return _ScaffoldManagerHelper._getChild(status, body);
  }
}
