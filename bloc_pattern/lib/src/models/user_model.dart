class UserListModel {
  List<UserModel> _userList = [];
  UserListModel.fromJson(data) {
    List<UserModel> temp = [];
    for (Map i in data) {
      temp.add(UserModel.fromJson(i));
      print('add...');
    }
    _userList = temp;
  }

  List<UserModel> get userList => _userList;
}

class UserModel {
  int _id;
  String _username;
  String _email;
  _Address _address;
  String _phone;
  String _website;
  _Company _company;

  UserModel.fromJson(Map<String, dynamic> parsedJson) {
    _id = parsedJson['id'];
    _username = parsedJson['username'];
    _email = parsedJson['email'];
    _address = _Address(parsedJson['address']);
    _phone = parsedJson['phone'];
    _website = parsedJson['website'];
    _company = _Company(parsedJson['company']);
  }

  int get id => _id;
  String get username => _username;
  String get email => _email;
  _Address get address => _address;
  String get phone => _phone;
  String get website => _website;
  _Company get company => _company;
}

class _Address {
  String _street;
  String _suite;
  String _city;
  String _zipcode;
  _Geo _geo;

  _Address(doc) {
    _street = doc['street'];
    _suite = doc['suit'];
    _city = doc['city'];
    _zipcode = doc['zipcode'];
    _geo = _Geo(doc['geo']);
  }

  String get street => _street;
  String get suite => _suite;
  String get city => _city;
  String get zipcode => _zipcode;
  _Geo get geo => _geo;
}

class _Geo {
  String _lat;
  String _lng;

  _Geo(doc) {
    _lat = doc['lat'];
    _lng = doc['lng'];
  }

  String get lat => _lat;
  String get lng => _lng;
}

class _Company {
  String _name;
  String _catchPhrase;
  String _bs;

  _Company(doc) {
    _name = doc['name'];
    _catchPhrase = doc['catchPhrase'];
    _bs = doc['bs'];
  }

  String get name => _name;
  String get catchPhrase => _catchPhrase;
  String get bs => _bs;
}
