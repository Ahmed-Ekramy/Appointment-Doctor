import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository repository;

  LoginUseCase(this.repository);

  Future<void> execute({
    required String email,
    required String password,
  }) {
    return repository.login(
      email: email,
      password: password,
    );
  }
}
