import '../repositories/sign_up_repository.dart';

class SignUpUseCase {
  final SignUpRepository repository;

  SignUpUseCase(this.repository);

  Future<void> execute({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) {
    return repository.signUp(
      name: name,
      email: email,
      phone: phone,
      password: password,
      confirmPassword: confirmPassword,
    );
  }
}
