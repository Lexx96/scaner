import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/cards/build_items_file_card.dart';
import 'package:scan_me/ui/common/expanded_single_child_scroll_view.dart';
import 'package:scan_me/ui/pages/tabs/main/main_vm.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

import 'widgets/add_file_buttons.dart';

class MainPage extends StatelessWidget {
  /// Пример описания виджета
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    final state = context.select((MainVM value) => value.state);
    final model = context.read<MainVM>();

    return Scaffold(
      body: ExpandedSingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: context.systemTopPadding,
            bottom: context.systemBottomPadding,
          ),
          child: Column(
            children: [
              AddFileButtons(
                camera: model.onCameraTap,
                gallery: model.onGalleryTap,
              ),
              BuildItemsFileCard(
                title: s.recentFiles,
                onTap: (int value) {},
                items: state.latestFiles,
                emptyMessage: s.recentlyYourFiles,
              ),
              SizedBox(height: 5.a),
              BuildItemsFileCard(
                title: s.favorites,
                onTap: (int value) {},
                items: state.favoritesFiles,
                emptyMessage: s.favoriteYourFiles,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
