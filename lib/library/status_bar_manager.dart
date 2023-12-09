library statusbarmanager_tg;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Текущая тема
enum CurrentTheme { light, dark }

/// Установка настроек системных элементов
void setStatusBarStyle(
  CurrentTheme theme, {
  Brightness? statusBarBrightness,
  Brightness? systemNavigationBarIconBrightness,
  Brightness? statusBarIconBrightness,
  Color? statusBarColor,
  Color? systemNavigationBarColor,
  Color? systemNavigationBarDividerColor,
}) {
  final isDark = theme == CurrentTheme.dark;

  if (Platform.isIOS) {
    SystemChrome.setSystemUIOverlayStyle(
      isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );
  } else {
    if (isDark) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarColor: statusBarColor ?? Colors.transparent,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarDividerColor: systemNavigationBarDividerColor,
      ));
    } else {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarColor: statusBarColor ?? Colors.transparent,
        systemNavigationBarColor: systemNavigationBarColor,
        systemNavigationBarDividerColor: systemNavigationBarDividerColor,
      ));
    }
  }
}

/// Управление системными элементами
void setEnabledSystemUIMode({
  required List<SystemUiOverlay> overlays,
  required SystemUiMode systemUiMode,
}) {
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: overlays,
  );
}

/// Менеджер управления нативными элементами устройства
class StatusBarManager extends StatelessWidget {
  /// Дочерний виджет
  final Widget child;

  /// Сделать ли statusBar прозрачным
  final bool translucent;

  /// Текущая тема
  final CurrentTheme theme;

  /// Цвет statusBar
  final Color? statusBarColor;

  /// Настройка информационных иконок statusBar
  final Brightness? statusBarIconBrightness;

  /// Настройка типа statusBar
  final Brightness? statusBarBrightness;

  /// Цвет navigationBar для светлой темы
  final Color? lightNavigationBarColor;

  /// Цвет navigationBar для темной темы
  final Color? darkNavigationBarColor;

  /// Настройка типа navigationBar
  final Brightness? navigationBarBrightness;

  /// Цвет разделителя navigationBar
  final Color? navigationBarDividerColor;

  const StatusBarManager({
    Key? key,
    required this.child,
    required this.translucent,
    required this.theme,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.statusBarBrightness,
    this.lightNavigationBarColor,
    this.navigationBarBrightness,
    this.navigationBarDividerColor,
    this.darkNavigationBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = theme == CurrentTheme.dark;
    if(isDark){
      setStatusBarStyle(
        theme,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarColor: darkNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: navigationBarDividerColor,
      );
    }else{
      setStatusBarStyle(
        theme,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarColor: lightNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: navigationBarDividerColor,
      );
    }

    return translucent ? child : SafeArea(child: child);
  }
}
