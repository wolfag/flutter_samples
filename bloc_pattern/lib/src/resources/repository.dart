import 'package:bloc_pattern/src/models/user_model.dart';
import 'package:bloc_pattern/src/resources/user_api_provider.dart';

class Repository {
  final userApiProvider = UserApiProvider();
  Future<UserListModel> fetchAllUsers() async {
    return userApiProvider.fetchUsers();
  }
}
