import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unaago/core/models/user_model.dart';
import 'auth_state.dart';

/// Cubit для управления состоянием аутентификации.
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  /// Метод для входа в систему (заглушка).
  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    // Имитация сетевого запроса
    await Future.delayed(const Duration(seconds: 2));

    // Временно создаем фейкового пользователя
    final mockUser = UserModel(
      id: '1',
      email: email,
      name: 'Test User',
      role: UserRole.renter,
    );

    emit(Authenticated(mockUser));
  }

  /// Метод для регистрации (заглушка).
  Future<void> register(UserModel user, String password) async {
    emit(AuthLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(Authenticated(user));
  }

  /// Выход из системы.
  void logout() {
    emit(Unauthenticated());
  }
}
