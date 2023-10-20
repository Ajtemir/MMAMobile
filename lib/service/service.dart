import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';

class AuthClient{
  var client = http.Client();
  Future<bool> postSingUp(String email,String password,String api) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "email" : email,
      "password" : password
    };


    var uri = Constants.addPathToBaseUrl('User/SignUp');
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return true;
    } else {
      print('error not found');
      print(response.body);
      return false;
      //throw exception and catch it in UI
    }
  }

  Future<String> postSingIn(String email,String password) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "email" : email,
      "password" : password
    };


    var uri = Constants.addPathToBaseUrl('User/SignIn');

    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return 'true';
    } else if(response.statusCode==400){
      print('error not found');
      print(response.body);
      return 'password';
      //throw exception and catch it in UI
    }else {
      print('error not found');
      print(response.body);
      return 'false';
      //throw exception and catch it in UI
    }
  }
}