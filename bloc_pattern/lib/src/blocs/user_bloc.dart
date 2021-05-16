import 'dart:async';

import 'package:bloc_pattern/src/models/user_model.dart';
import 'package:bloc_pattern/src/resources/repository.dart';
import 'package:rxdart/rxdart.dart';

class UsersBloc {
  final _repository = Repository();
  final _userFetcher = PublishSubject<UserListModel>();

  Stream get userFetcherStream => _userFetcher.stream;

  fetchAllUsers() async {
    UserListModel userListModel = await _repository.fetchAllUsers();
    _userFetcher.sink.add(userListModel);
  }

  dispose() {
    _userFetcher.close();
  }
}
