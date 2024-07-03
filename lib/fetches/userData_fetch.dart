import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/model/userDataModel.dart';
import 'package:upai_app/views/auth/server/service.dart';


Future<UserDataModel> fetchUserData(String email) async {
  final response = await AuthClient().getUserData(email);

  return UserDataModel.fromJson(jsonDecode(response));
}
