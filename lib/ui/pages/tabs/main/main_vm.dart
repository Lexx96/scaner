import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scan_me/util/vm_utils.dart';

abstract class MainService {
  /// Получение последних файлов
  Future<List<File>> getLatestFiles();

  /// Получение избранных файлов
  Future<List<File>> getFavoritesFiles();
}

/// Состояние [MainVM]
class MainState {
  /// Последние файлы
  final List<File> latestFiles;

  /// Избранные файлы
  final List<File> favoritesFiles;

  MainState({
    this.latestFiles = const [],
    this.favoritesFiles = const [],
  });

  MainState copyWith({
    List<File>? latestFiles,
    List<File>? favoritesFiles,
  }) {
    return MainState(
      latestFiles: latestFiles ?? this.latestFiles,
      favoritesFiles: favoritesFiles ?? this.favoritesFiles,
    );
  }
}

/// Управление состоянием [MainPage]
class MainVM extends VMUtils<MainState> {
  final BuildContext context;

  MainVM(
    super.initialState, {
    required this.context,
  });

  @override
  void init() {
    super.init();
    notify(
      state.copyWith(
        latestFiles: [
          File(''),
          File(''),
          File(''),
          File(''),
          File(''),
          File('')
        ],
        favoritesFiles: [File(''), File(''), File('')],
      ),
    );
  }

  /// Обработка нажатия на кнопку 'Камера'
  void onCameraTap() {}

  /// Обработка нажатия на кнопку 'Галлерея'
  void onGalleryTap() {}
}
