import 'package:flutter/cupertino.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/buttons/app_icon_button.dart';
import 'package:scan_me/ui/common/title_widget.dart';
import 'package:scan_me/ui/theme/app_colors.dart';
import 'package:scan_me/ui/theme/app_padding.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

class AddFileButtons extends StatelessWidget {
  /// Добавление нового файла
  const AddFileButtons({
    super.key,
    required this.camera,
    required this.gallery,
  });

  /// Добавления с камеры устройства
  final VoidCallback camera;

  /// Добавления из галлереи устройства
  final VoidCallback gallery;

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return Padding(
      padding: EdgeInsets.only(top: 25.a),
      child: Column(
        children: [
          TitleWidget(title: s.addFile),
          SizedBox(height: 10.a),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.width),
            child: Row(
              children: [
                Expanded(
                  child: AppIconButton(
                    height: 150.a,
                    iconSize: 50.a,
                    innerPadding: 50.a,
                    icon: CupertinoIcons.camera,
                    onTap: camera,
                    backgroundColor: AppColorsLight.white,
                  ),
                ),
                SizedBox(width: 5.a),
                Expanded(
                  child: AppIconButton(
                    height: 150.a,
                    iconSize: 50.a,
                    icon: CupertinoIcons.photo,
                    onTap: gallery,
                    backgroundColor: AppColorsLight.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
