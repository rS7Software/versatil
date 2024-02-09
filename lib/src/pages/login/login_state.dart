import '../../utilities/validation_item.dart';

class LoginState {
  ValidationItem username;
  ValidationItem password;
  String accion;

  LoginState({
    this.username = const ValidationItem(),
    this.password = const ValidationItem(),
    this.accion = ''
  });

  LoginState copyWith({
    ValidationItem? username,
    ValidationItem? password,
    String? accion,
  }) => LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      accion: accion ?? this.accion
  );
}