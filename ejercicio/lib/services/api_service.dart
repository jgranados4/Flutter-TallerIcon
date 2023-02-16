import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../config.dart';
import '../model/user_model.dart';

class APIService {
  static var client = http.Client();

  static Future<List<UserModel>?> getUsers() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.userAPI,
    );
    //http://127.0.0.1:3000/api/user

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      //print(data);
      return userFromJson(data["employees"]);
    } else {
      return null;
    }
  }

  static Future<bool> saveUser(
    UserModel model,
  ) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(
      Config.apiURL,
      Config.userAPI + "/add_employee/",
    );

    var response = await client.post(
      url,
      headers: requestHeaders,
      body: json.encode(
        model,
      ),
      /*body: json.encode(
        model.toJson(),
      ),*/
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deleteUser(userId) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(
      Config.apiURL,
      Config.userAPI + "/delete_employee/" + userId,
    );

    var response = await client.delete(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
