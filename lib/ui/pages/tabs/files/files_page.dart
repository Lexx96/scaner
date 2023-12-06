import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/ui/pages/tabs/files/files_vm.dart';

class FilesPage extends StatelessWidget {
  /// Пример описания виджета
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final count = context.select((FilesVM value) => value.state.countUI);
    final model = context.read<FilesVM>();

    return const Scaffold(
      body: Center(
        child: Text('Файлы'),
      ),
    );
  }
}
