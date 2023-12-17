import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/library/scaffold_manager/scaffold_manager.dart';
import 'package:scan_me/ui/common/img_url_widget.dart';
import 'package:scan_me/ui/resources/assets_path.dart';

class ProfilePage extends StatelessWidget {
  /// Экран профиля пользователя
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldManager(
      status: ScaffoldManagerStatus.loaded,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImgUrlWidget(
              size: 100.a,
              url:
                  'https://sun9-36.userapi.com/impf/c625220/v625220779/47a86/-k9mm4ep9J4.jpg?size=604x403&quality=96&sign=824521c0adb36403e1cbadfa95f156ea&c_uniq_tag=Q-7TQOIKbsYyELhQ84pTjoOUAm6tLttdZLXSTkxZNW0&type=album',
              placeholder: AssetsPath.logo,
            )
          ],
        ),
      ),
    );
  }
}
