import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/app_ink_well.dart';
import 'package:scan_me/ui/common/img_url_widget.dart';
import 'package:scan_me/ui/pages/tabs/profile/profile_vm.dart';
import 'package:scan_me/ui/resources/assets_path.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/app_colors.dart';
import 'package:scan_me/ui/theme/app_padding.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

class UserInfo extends StatelessWidget {
  /// Информация о пользователе
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final user = context.select((ProfileVM value) => value.state.user);
    final model = context.read<ProfileVM>();

    return Container(
      padding: AppPadding.widthPadding,
      width: double.infinity,
      color: AppColorsLight.white,
      child: Padding(
        padding: EdgeInsets.only(top: 25.a),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 3.a),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImgUrlWidget(
                    size: 100.a,
                    url: user.avatar,
                    placeholder: AssetsPath.logo,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.a),
                    child: Text(
                      '${user.name} ${user.surName}',
                      style: context.blackWhite24w500(),
                    ),
                  ),
                ],
              ),
            ),
            AppInkWell(
              borderRadius: BorderRadius.circular(AppBorderRadius.radius5),
              onTap: model.updatePhoto,
              child: Padding(
                padding: EdgeInsets.all(3.a),
                child: Text(
                  s.changePhoto,
                  style: context.mBlue18(fontWeight: FontWeight.w300),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
