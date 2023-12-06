import 'package:flutter/material.dart';
import 'package:scan_me/library/adaptive/adaptive.dart';
import 'package:scan_me/ui/common/app_ink_well.dart';
import 'package:scan_me/ui/resources/assets_path.dart';
import 'package:scan_me/ui/theme/app_border_radius.dart';
import 'package:scan_me/ui/theme/src/theme_extension.dart';

import '../../theme/app_padding.dart';

class BuildItemsFileCard extends StatelessWidget {
  /// Картокчка одного файла
  const BuildItemsFileCard({
    super.key,
    required this.onTap,
    this.title = '',
    this.titleWidget,
  });

  /// Коллбак на нажите по карточке файла
  final ValueChanged<int> onTap;

  /// Заголовок
  final String title;

  /// Дополнительный виджет в [_TitleWidget]
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TitleWidget(
          title: title,
          widget: titleWidget,
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => _ItemFileCard(
                onTap: onTap,
                index: index,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ItemFileCard extends StatelessWidget {
  /// Карточка файла
  const _ItemFileCard({
    required this.onTap,
    required this.index,
  });

  /// Коллбак на нажите по карточке файла
  final ValueChanged<int> onTap;

  /// Текущий index
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: index == 0 ? AppPadding.mainWidth : 0,
        right: index + 1 == 10 ? AppPadding.mainWidth : 10.wA,
        bottom: 10.wA,
        top: 10.wA,
      ),
      child: AppInkWell(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        onTap: () => onTap(0),
        child: Container(
          height: 150.adaptive,
          width: 110.adaptive,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
            boxShadow: [
              BoxShadow(
                color: context.theme.borderColor.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 3,
                offset: const Offset(0, 0),
              ),
            ],
            image: const DecorationImage(
              image: AssetImage(AssetsPath.logo),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _TitleWidget extends StatelessWidget {
  /// Виджет описания назначения виджета
  const _TitleWidget({
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
            child: Text(
              title,
              style: context.mBlack24(),
            ),
          ),
        ),
        if (widget != null) widget!
      ],
    );
  }
}
