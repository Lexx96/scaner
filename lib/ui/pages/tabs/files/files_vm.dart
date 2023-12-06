import 'package:auto_route/auto_route.dart';
import 'package:scan_me/util/vm_utils.dart';
import 'package:flutter/material.dart';

import '../../../navigation/navigation.gr.dart';

/// Состояние [FilesVM]
class FilesVMState {
  int count;

  FilesVMState({
    this.count = 0,
  });

  String get countUI => count.toString();

  FilesVMState copyWith({
    int? count,
    String? countUI,
  }) {
    return FilesVMState(
      count: count ?? this.count,
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
    // TODO: implement init
    super.init();
  }

  /// Инкрементирование
  void increment () {
    notify(state.copyWith(count: state.count += 1));
  }

  /// Декрементирование
  void decrement () {
    notify(state.copyWith(count: state.count -= 1));
  }

  /// Навигация на экран [InternalPage]
  void pushInternalPage() {
    context.pushRoute(IInternalRoute(counter: state.count));
  }
}
