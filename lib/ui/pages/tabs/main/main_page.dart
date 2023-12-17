import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/di/app_factory.dart';
import 'package:scan_me/library/scaffold_manager/scaffold_manager.dart';
import 'package:scan_me/ui/common/expanded_single_child_scroll_view.dart';
import 'package:scan_me/ui/pages/tabs/main/main_vm.dart';

import 'widgets/add_file_buttons.dart';

class MainPage extends StatelessWidget {
  /// Пример описания виджета
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {

    final state = context.select((MainVM value) => value.state);
    final model = context.read<MainVM>();

    return ScaffoldManager(
      status: ScaffoldManagerStatus.loaded,
      body: ExpandedSingleChildScrollView(
        child: Column(
          children: [
            AddFileButtons(
              camera: model.onCameraTap,
              gallery: model.onGalleryTap,
            ),
            WidgetFactory.stockBanner(),
          ],
        ),
      ),
    );
  }
}


