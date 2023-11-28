import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../model/auction/auction_bloc/api/execute_result.dart';

class AppHttpClient{
  static const accessToken = "accessToken";
  static const refreshToken = "refreshToken";
  static Future<ExecuteResult<T>> execute<T>(
      HttpMethod method,
      String path,
      Map<String, dynamic> map,
      {
        T Function(Map<String, dynamic>)? dataConstructor,
        bool isList = false,
        hasToken = true
      }) async {
    var url = Constants.addPathToBaseUrl(path, queryParameters: method == HttpMethod.get ? map : null);
    var headers = {"Content-Type":"application/json", "Accept":"*/*"};

    if(hasToken){
      var sharedPreferences = await SharedPreferences.getInstance();
      var accessToken = sharedPreferences.getString("accessToken");
      if(accessToken == null){
        throw Exception("");
      }
      headers["Authorization"] = accessToken;
    }
    http.Response response;

    switch(method){
      case HttpMethod.post:
        response = await http.Client().post(url, body: jsonEncode(map), headers: headers);
        break;
      case HttpMethod.get:
        response = await http.Client().get(url, headers: headers);
        break;
      case HttpMethod.delete:
        response = await http.Client().delete(url, body: jsonEncode(map), headers: headers);
        break;
    }

    if(response.statusCode == 401) {
      var sharedPreferences = await SharedPreferences.getInstance();
      var refreshToken = sharedPreferences.getString(AppHttpClient.refreshToken);
      var url = Constants.addPathToBaseUrl('/User/SignIn');
      var response = await http.Client().post(url, headers: {
        "Content-Type":"application/json",
        "Accept":"*/*",
        "Authorization": refreshToken!,
      });
      if(response.statusCode == 401){
        throw Exception("Refresh Token expired");
      }

      if(response.statusCode == 200){
        var prefs = await SharedPreferences.getInstance();
        var json = jsonDecode(response.body);
        prefs.setString(AppHttpClient.accessToken, json[AppHttpClient.accessToken]);
        prefs.setString(AppHttpClient.refreshToken, json[AppHttpClient.refreshToken]);
        headers[AppHttpClient.accessToken] = json[AppHttpClient.accessToken];
        switch(method){
          case HttpMethod.post:
            response = await http.Client().post(url, body: jsonEncode(map), headers: headers);
            break;
          case HttpMethod.get:
            response = await http.Client().get(url, headers: headers);
            break;
          case HttpMethod.delete:
            response = await http.Client().delete(url, body: jsonEncode(map), headers: headers);
            break;
        }
      }
    }

    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json, dataConstructor: dataConstructor, isList: isList);
    if(result.isBad){
      throw Exception(result.message);
    }
    return result;
  }
}

enum HttpMethod{
  get,
  post,
  delete,
}

