import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:scan_me/util/vm_utils.dart';
import 'package:flutter/material.dart';

import '../../../navigation/navigation.gr.dart';

abstract class MainService {
  /// Получение последних файлов
  Future<List<File>> getLatestFiles();

  /// Получение избранных файлов
  Future<List<File>> getFavoritesFiles();
}

/// Состояние [FilesVM]
class FilesVMState {
  /// Последние файлы
  final List<File> latestFiles;

  /// Избранные файлы
  final List<File> favoritesFiles;

  FilesVMState({
    this.latestFiles = const [],
    this.favoritesFiles = const [],
  });

  FilesVMState copyWith({
    List<File>? latestFiles,
    List<File>? favoritesFiles,
    int? count,
  }) {
    return FilesVMState(
      latestFiles: latestFiles ?? this.latestFiles,
      favoritesFiles: favoritesFiles ?? this.favoritesFiles,
    );
  }
}

/// Управление состоянием [ExamplePage1]
class FilesVM extends VMUtils<FilesVMState> {
  /// Принимаемые параметры
  final BuildContext context;

  FilesVM({
    required FilesVMState state,
    required this.context,
  }) : super(state);

  @override
  void init() {
    notify(
      state.copyWith(
        latestFiles: [
          File(''),
          File(''),
          File(''),
          File(''),
          File(''),
          File(''),
        ],
        favoritesFiles: [],
      ),
    );
    super.init();
  }

  /// Инкрементирование
  void increment() {
    notify(state.copyWith());
  }

  /// Декрементирование
  void decrement() {
    notify(state.copyWith());
  }

  /// Навигация на экран [InternalPage]
  void pushInternalPage() {
    context.pushRoute(IInternalRoute(counter: 0));
  }
}
