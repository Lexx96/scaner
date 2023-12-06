import 'dart:io';

import 'package:flutter/material.dart';

/// Основные размеры использемые в проекте
abstract class AppSize {

  static const dividerHeight = 0.0,

  /// Высота кнопок согласно Figma
      buttonHeight = 50.0,

  /// Высота AppBar согласно Figma
      appBarHeight = 50.0;

  static final bottomPadding =
      (Platform.isIOS ? kBottomNavigationBarHeight / 3 : 0).toDouble();
}
