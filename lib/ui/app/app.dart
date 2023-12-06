import 'package:provider/provider.dart';
import 'package:scan_me/generated/l10n.dart';
import 'package:scan_me/ui/app/app_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'widgets/app_ui_settings.dart';

/// Корневой виджет приложения
class App extends StatelessWidget {
  final RouterConfig<Object> config;

  const App({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    final state = context.select((AppVM value) => value.state);

    return AppUISettings(
      adaptiveState: state.adaptiveState,
      builder: (ThemeData light, ThemeData dark) => MaterialApp.router(
        theme: light,
        darkTheme: dark,
        locale: state.locale,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
        supportedLocales: state.supportedLocales,
        routerConfig: config,
      ),
    );
  }
}
