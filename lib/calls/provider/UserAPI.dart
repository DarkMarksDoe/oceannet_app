import 'dart:convert';
import 'package:oceannet/consts/ConstApi.dart';
import 'package:oceannet/models/UserModel.dart';
import 'package:http/http.dart' as http;

abstract class UserBase {
  Future<Map<String, dynamic>> postUser(UserModel newModel);

  Future<List<UserModel>> createListUsers();

  Future<Map<String, dynamic>> updateUser(int idUsr, UserModel user);
}

class UserApiCall with UserBase {
  @override
  Future<List<UserModel>> createListUsers() async {
    http.Response response;
    response = await http.get(ConstsAPI.usersApiUrl + '/');
    final List<dynamic> parsed = json.decode(response.body);
    List<UserModel> modelList = new List<UserModel>();
    parsed.forEach((user) {
      UserModel newUser = new UserModel.fromJson(user);
      modelList.add(newUser);
    });
    return modelList;
  }

  Future<Map<String, dynamic>> postUser(UserModel newModel) async {
    Map<String, String> headers = {
      "name": "${newModel.name}",
      "lastname": "${newModel.lastname}",
      "genre": " ${newModel.genre}",
      "born_date": "${newModel.bornDate}",
      "latitude": "${newModel.latitude}",
      "longitude": "${newModel.longitude}",
      "url_profile_picture": "${newModel.urlProfilePicture}"
    };
    http.Response response =
        await http.post(ConstsAPI.usersApiUrl + '?', body: headers);
    int statusCode = response.statusCode;
    if (statusCode == 201) {
      return {'statusCode': statusCode, 'response': response.body};
    } else {
      return {'statusCode': statusCode, 'response': response.body};
    }
  }

  Future<Map<String, dynamic>> makeDeleteRequest(String idUsr) async {
    // post 1
    String url = ConstsAPI.usersApiUrl + '/' + idUsr;
    // make DELETE request
    http.Response response = await http.delete(url);
    // check the status code for the result
    int statusCode = response.statusCode;
    return {'statusCode': statusCode, 'response': response.body};
  }

  Future<Map<String, dynamic>> updateUser(int idUsr, UserModel user) async {
    Map<String, String> headers = {
      "name": "${user.name}",
      "lastname": "${user.lastname}",
      "genre": " ${user.genre}",
      "born_date": "${user.bornDate}",
      "latitude": "${user.latitude}",
      "longitude": "${user.longitude}",
      "url_profile_picture": "${user.urlProfilePicture}"
    };
    http.Response response =
        await http.put(ConstsAPI.usersApiUrl + '/$idUsr?', body: headers);

    int statusCode = response.statusCode;
    return {'statusCode': statusCode, 'response': response.body};
  }
}
