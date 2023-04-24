import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthClient{
  var client = http.Client();


  Future<dynamic> getProducts() async {
    var uri = Uri(
      scheme: 'http',
      host: '192.168.213.236',
      port: 80,
      path: 'Products/Index',
    );

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
    }
  }

  Future<bool> postSingUp(String email,String password,String api) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "email" : email,
      "password" : password
    };





    var uri = Uri(
      scheme: 'http',
      host: '192.168.225.236',
      port: 80,
      path: 'User/SignUp',
    );
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



    var uri = Uri(
      scheme: 'http',
      host: '192.168.225.236',
      port: 80,
      path: 'User/SignIn',
    );
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

  Future<bool> getConfirmEmail(String email) async {
    //var _payload = json.encode(object);

    email=email.replaceAll('@', '%40');
    print(email);

    var url=Uri.parse('http://192.168.225.236/User/SendCodeWordToEmailToConfirmEmail?email=$email');
    var uri = Uri(
      scheme: 'http',
      host: '192.168.225.236',
      port: 80,
      path: "User/SendCodeWordToEmailToConfirmEmail?email=$email",
    );
    var response = await client.get(url);
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

  Future<bool> postConfirmEmail(String email,String kod) async {
    //var _payload = json.encode(object);

    Map<String, String> json={
      "secretWord" : kod,
      "email" : email
    };



    var uri = Uri(
      scheme: 'http',
      host: '192.168.225.236',
      port: 80,
      path: 'User/ConfirmEmail',
    );
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
  Future<int> postProductAdd(var json) async {
    //var _payload = json.encode(object);



    var uri = Uri(
      scheme: 'http',
      host: '192.168.213.236/',
      port: 80,
      path: 'Products/AddWithEmail',
    );
    var response = await client.post(uri,body: jsonEncode(json), headers: {"Content-Type":"application/json","Accept":"*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return int.parse(response.body);
    } else {
      print('error not found');
      print(response.body);
      return 0;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postProductPhotoAdd(String path) async {
    var uri = Uri(
      scheme: 'http',
      host: '192.168.225.236',
      port: 80,
      path: 'ProductPhoto/AddFile',
    );
  var request = http.MultipartRequest('POST', uri);


//for image and videos and files

request.files.add(await http.MultipartFile.fromPath("Images", path));

//for completeing the request
var response =await request.send();

//for getting and decoding the response into json format
var responsed = await http.Response.fromStream(response);
final responseData = json.decode(responsed.body);


if (response.statusCode==200) {
print("SUCCESS");
print(responseData);
return true;
}
else {
print("ERROR");
return false;
}
}



}