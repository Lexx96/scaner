import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/app_padding.dart';

class BannerCard extends StatelessWidget {

  /// Карточка баннера
  const BannerCard({
    super.key,
    required this.child,
    this.colors,
    this.color,
  });

  /// Дочерний виджет
  final Widget child;

  /// Цвета градиента
  final List<Color>? colors;

  /// Цвет карточки
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AppPadding.width),
      padding: EdgeInsets.all(18.a),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        gradient: colors != null
            ? LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: colors!,
        )
            : null,
      ),

      child: child,
    );
  }
}