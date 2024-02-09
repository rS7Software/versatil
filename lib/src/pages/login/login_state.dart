import '../../utilities/validation_item.dart';

class LoginState {
  ValidationItem email;
  ValidationItem password;
  String accion;

  LoginState({
    this.email = const ValidationItem(),
    this.password = const ValidationItem(),
    this.accion = ''
  });

  LoginState copyWith({
    ValidationItem? email,
    ValidationItem? password,
    String? accion,
  }) => LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      accion: accion ?? this.accion
  );
}