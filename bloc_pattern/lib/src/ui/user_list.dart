import 'package:bloc_pattern/src/blocs/user_bloc.dart';
import 'package:bloc_pattern/src/models/user_model.dart';
import 'package:flutter/material.dart';

class UserList extends StatelessWidget {
  UserList({Key key}) : super(key: key);
  final bloc = UsersBloc();

  Widget buildList(AsyncSnapshot<UserListModel> snapshot) {
    return GridView.builder(
      itemCount: snapshot.data.userList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Text(snapshot.data.userList[index].username);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bloc.fetchAllUsers();

    return Scaffold(
      appBar: AppBar(
        title: Text('User list'),
      ),
      body: StreamBuilder<UserListModel>(
        stream: bloc.userFetcherStream,
        builder: (
          context,
          snapshot,
        ) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
