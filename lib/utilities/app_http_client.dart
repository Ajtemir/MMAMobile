import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants/constants.dart';
import '../model/auction/auction_bloc/api/execute_result.dart';

class AppHttpClient{

  static Future<ExecuteResult> execute<T>(HttpMethod method,String path, Map<String, dynamic> map, {bool isList = false, T Function(Map<String, dynamic>)? dataConstructor}) async {
    var url = Constants.addPathToBaseUrl(path, queryParameters: method == HttpMethod.get ? map : null);
    const headers = {"Content-Type":"application/json","Accept":"*/*"};
    http.Response response;
    switch(method){
      case HttpMethod.post:
        response = await http.Client().post(url, body: jsonEncode(map), headers: headers);
        break;
      case HttpMethod.get:
        response = await http.Client().get(url);
        break;
      case HttpMethod.delete:
        response = await http.Client().delete(url, body: jsonEncode(map), headers: headers);
        break;
    }
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json, dataConstructor: dataConstructor, isList: isList);
    if(result.isBad){
      throw Exception(result.message);
    }
    return result;
  }
  static Future<ExecuteResult> post<T>(String path, Map<String, dynamic> map, {bool isList = false, T Function(Map<String, dynamic>)? dataConstructor}) async {
    var url = Constants.addPathToBaseUrl(path);
    var response = await http.Client().post(url, body: jsonEncode(map), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json, dataConstructor: dataConstructor, isList: isList);
    if(result.isBad){
      throw Exception(result.message);
    }
    return result;
  }

  static Future<ExecuteResult> delete<T>(String path, Map<String, dynamic> map, {bool isList = false, T Function(Map<String, dynamic>)? dataConstructor}) async {
    var url = Constants.addPathToBaseUrl(path);
    var response = await http.Client().delete(url, body: jsonEncode(map), headers: {"Content-Type":"application/json","Accept":"*/*"});
    var json = jsonDecode(response.body);
    var result = ExecuteResult.fromJson(json, dataConstructor: dataConstructor, isList: isList);
    if(result.isBad){
      throw Exception(result.message);
    }
    return result;
  }

  static Future<ExecuteResult> get<T>(String path, Map<String, dynamic>? map, {bool isList = false, T Function(Map<String, dynamic>)? dataConstructor}) async {
    var url = Constants.addPathToBaseUrl(path, queryParameters: map);
    var response = await http.Client().get(url);
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

