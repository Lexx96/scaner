import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/app_ink_well.dart';
import 'package:scan_me/ui/common/buttons/app_button/app_button.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

class AppFloatingActionButton extends StatelessWidget {
  /// Кастомный виджет [FloatingActionButton]
  const AppFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      onTap: () {},
      child: AppButton(
        stateButton: StateButton.loading,
        height: 50.a,
        width: 50.a,
        onTap: () {  },
        child: Icon(
          Icons.add,
          color: context.theme.scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
