import 'package:flutter/widgets.dart';
import 'package:oceannet/models/UserModel.dart';

import 'UserAPI.dart';

class UserProvider extends ChangeNotifier {
  List<UserModel> _usersList = new List<UserModel>();

  UserModel _userModel;
  UserModel _newModel;

  int _usersCount;

  int get usersCount => _usersCount;
  List<UserModel> get usersList => _usersList;
  UserModel get userModel => _userModel;

  set user(UserModel userModel) => _userModel = userModel;
  set newUser(UserModel newModel) => _newModel = newModel;

  Future<Map<dynamic, dynamic>> updateUser() async {
    Map response = await UserApiCall().updateUser(userModel.id, _newModel);
    createListUser();
    _userModel = _newModel;
    notifyListeners();
    return response;
  }

  Future createListUser() async {
    try {
      _usersList = await UserApiCall().createListUsers();
      _usersCount = _usersList.length;
      notifyListeners();
    } catch (createError) {
      print('First list error ' + createError.toString());
    } finally {
      print('Finish Get Initial List');
    }
  }

  int getUsersCount() {
    return _usersCount;
  }
}
