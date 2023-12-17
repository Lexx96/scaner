import 'package:flutter/material.dart';
import 'package:scan_me/util/vm_utils.dart';

/// Состояние [MainVM]
class MainState {}

/// Управление состоянием [MainPage]
class MainVM extends VMUtils<MainState> {
  final BuildContext context;

  MainVM(
    super.initialState, {
    required this.context,
  });

  /// Обработка нажатия на кнопку 'Камера'
  void onCameraTap() {}

  /// Обработка нажатия на кнопку 'Галлерея'
  void onGalleryTap() {}
}
