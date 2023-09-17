import 'dart:convert';
import 'package:upai_app/model/userDataModel.dart';
import 'package:upai_app/service/service.dart';

Future<UserDataModel> fetchUserData(String email) async {
  final response = await AuthClient().getUserData(email);

  return UserDataModel.fromJson(jsonDecode(response));
}
