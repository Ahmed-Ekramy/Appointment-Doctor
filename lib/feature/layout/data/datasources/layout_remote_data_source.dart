import '../../../../core/api/api_consumer.dart';
import '../models/user_model.dart';

abstract class LayoutRemoteDataSource {
  Future<UserModel> getUserData();
}

class LayoutRemoteDataSourceImpl implements LayoutRemoteDataSource {
  final ApiConsumer apiConsumer;

  LayoutRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<UserModel> getUserData() async {
    // Example: final response = await apiConsumer.get('user/profile');
    // return UserModel.fromJson(response);
    
    // Placeholder logic
    await Future.delayed(const Duration(seconds: 1));
    return UserModel(id: '1', name: 'John Doe', email: 'john@example.com');
  }
}
