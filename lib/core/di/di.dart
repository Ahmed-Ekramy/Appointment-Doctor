
import '../../feature/login/data/data_sources/login_remote_dto.dart';
import '../../feature/login/data/repositories/login_data_repo.dart';
import '../../main.dart';

void servicesLocator() {
  getIt.registerSingleton<LoginDataRepo>(
      (LoginDataRepo(LoginRemoteDto())));
}
