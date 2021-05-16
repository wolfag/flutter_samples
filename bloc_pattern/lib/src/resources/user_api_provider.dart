import 'dart:convert';

import 'package:bloc_pattern/src/models/user_model.dart';
import 'package:http/http.dart' show Client;

class UserApiProvider {
  Client client = Client();
  String _url = 'jsonplaceholder.typicode.com';

  Future<UserListModel> fetchUsers() async {
    Uri uri = Uri.https(_url, 'users');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      return UserListModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Faild to load user');
    }
  }
}
