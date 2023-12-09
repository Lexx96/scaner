
import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/theme/app_padding.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class TitleWidget extends StatelessWidget {
  /// Виджет описания назначения виджета
  const TitleWidget({
    super.key,
    required this.title,
    this.widget,
  });

  /// Заголовок
  final String title;

  /// Дополнительный виджет
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Visibility(
          visible: title.isNotEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: AppPadding.mainWidth),
            child: SizedBox(
              width: 80.wS,
              child: Text(
                title,
                style: context.mBlack24(),
              ),
            ),
          ),
        ),
        if (widget != null) widget!
      ],
    );
  }
}