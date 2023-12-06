import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:scan_me/ui/navigation/navigation.gr.dart';
import 'package:scan_me/ui/theme/app_durations.dart';
import 'package:scan_me/util/future_utils.dart';

/// Управление состоянием [LoadingPage]
class LoadingVM with FutureUtils {
  ///  Принимаемые параметры
  final BuildContext context;

  LoadingVM(this.context) {
    // _entry();
  }

  Future<void> _entry() async {
    await Future.delayed(AppDuration.oneSecond);
    await doFuture(
      future: Future.delayed(AppDuration.oneSecond),
      onValue: (value) {
        context.router.replace(const IDashboardRoute());
      },
      onError: (_, msg) {
        context.router.replace(
          ISomethingWrongRoute(msg: msg ?? ''),
        );
      },
    );
  }

  void onEnd() {
    context.router.replace(const IDashboardRoute());
  }
}
