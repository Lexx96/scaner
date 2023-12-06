import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/cards/build_items_file_card.dart';
import 'package:scan_me/ui/common/expanded_single_child_scroll_view.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';
import 'package:scan_me/util/extensions/context_extensions.dart';

class MainPage extends StatelessWidget {

  /// Пример описания виджета
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return Scaffold(
      body: ExpandedSingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: context.systemTopPadding,
            bottom: context.systemBottomPadding,
          ),
          child: Column(
            children: [
              BuildItemsFileCard(
                title: s.recentFiles,
                onTap: (int value) {},
              ),
              SizedBox(height: 5.hS),
              BuildItemsFileCard(
                title: s.favorites,
                onTap: (int value) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}