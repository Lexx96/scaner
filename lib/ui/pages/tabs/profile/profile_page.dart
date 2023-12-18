import 'package:flutter/material.dart';
import 'package:scan_me/library/scaffold_manager/scaffold_manager.dart';
import 'package:scan_me/ui/common/expanded_single_child_scroll_view.dart';
import 'package:scan_me/ui/pages/tabs/profile/widgets/user_info.dart';

class ProfilePage extends StatelessWidget {
  /// Экран профиля пользователя
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldManager(
      status: ScaffoldManagerStatus.loaded,
      body: ExpandedSingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserInfo(),
          ],
        ),
      ),
    );
  }
}
