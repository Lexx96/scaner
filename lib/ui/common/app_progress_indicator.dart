import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';

class AppProgressIndicator extends StatelessWidget {
  /// Анимация загрузки
  const AppProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.a,
      width: 50.a,
      child: const CircularProgressIndicator.adaptive(),
    );
  }
}
