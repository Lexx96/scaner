import 'package:flutter/material.dart';
import 'package:scan_me/domain/entity/user.dart';
import 'package:scan_me/domain/services/user_service.dart';
import 'package:scan_me/util/vm_utils.dart';

/// Состояние [ProfileVM]
class ProfileState {

  /// Данные профиля пользователя
  final User user;

  ProfileState({User? user}) : user = User.zero();

  ProfileState copyWith({
    User? user,
  }) {
    return ProfileState(
      user: user ?? this.user,
    );
  }
}

/// Управление состоянием [ProfilePage]
class ProfileVM extends VMUtils<ProfileState> {
  /// Принимаемые параметры
  final BuildContext context;
  late IUserService _userService;

  ProfileVM(
    super.initialState, {
    required this.context,
    required IUserService userService,
  }) {
    _userService = userService;
  }

  /// Обработчик нажатия на кнопку "Изменить фото"
  void updatePhoto() {}
}
