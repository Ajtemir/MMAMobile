import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upai_app/DTOs/submit_collective_argument.dart';
import 'package:upai_app/constants/constants.dart';
import 'package:upai_app/utilities/app_http_client.dart';

import '../../../DTOs/make_collective_post.dart';
import '../../../DTOs/unmake_collective_product.dart';

class AuthClient {
  var client = http.Client();
  static var ip = '192.168.164.236';

  Future<dynamic> getProducts() async {
    var uri = Constants.addPathToBaseUrl('Products/Index');

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      //throw exception and catch it in UI
      print('error not found');
    }
  }

  Future<dynamic> getCategoryProducts(String id) async {
    var uri = Constants.addPathToBaseUrl('Products/getProductsByCategoryId',
        queryParameters: {'categoryId': id});

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

  Future<dynamic> getSearchProducts(String search) async {
    var uri = Constants.addPathToBaseUrl('Products/Search');
    var json = {"description": search};
    var response = await client.post(uri,
        body: jsonEncode(json), headers: {'Content-Type': 'application/json'});
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

  Future<dynamic> getCategories() async {
    var uri = Constants.addPathToBaseUrl('Categories/Index');

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

  static Future<LocationData?> getLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  Future<dynamic> getProductsFavorite(String email) async {
    var uri = Constants.addPathToBaseUrl('Favorites/GetFavorites',
        queryParameters: {'email': email});

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

  Future<dynamic> getProductData(String productId, String email) async {
    var uri = Constants.addPathToBaseUrl('Products/GetById',
        queryParameters: {'productId': productId, 'email': email});

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

  Future<String> getSetFavorite(String productId, String email) async {
    var uri = Constants.addPathToBaseUrl('Favorites/SetFavorite',
        queryParameters: {'email': email, 'productId': productId});

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return 'true';
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      return 'false';
    }
  }

  Future<String> getUnSetFavorite(String productId, String email) async {
    var uri = Constants.addPathToBaseUrl('Favorites/UnsetFavorite',
        queryParameters: {'email': email, 'productId': productId});

    var response = await client.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.body);
      return 'true';
    } else {
      //throw exception and catch it in UI
      print('error not found');
      print(response.statusCode);
      print(response.body);
      return 'false';
    }
  }

  Future<bool> postSingUp(String email, String password, String api) async {
    //var _payload = json.encode(object);

    Map<String, String> json = {"email": email, "password": password};

    var uri = Constants.addPathToBaseUrl('User/SignUp');

    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
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

  Future<String> postSingIn(String email, String password) async {
    //var _payload = json.encode(object);

    Map<String, String> json = {"email": email, "password": password};

    var uri = Constants.addPathToBaseUrl('User/SignIn');

    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      var prefs = await SharedPreferences.getInstance();
      var json = jsonDecode(response.body);
      prefs.setString(
          AppHttpClient.accessToken, json[AppHttpClient.accessToken]);
      prefs.setString(
          AppHttpClient.refreshToken, json[AppHttpClient.refreshToken]);
      print(response.statusCode);
      return 'true';
    } else if (response.statusCode == 400) {
      print('error not found');
      print(response.body);
      return 'password';
      //throw exception and catch it in UI
    } else {
      print('error not found');
      print(response.body);
      return 'false';
      //throw exception and catch it in UI
    }
  }

  Future<String> postFreedomPay(var json) async {
    //var _payload = json.encode(object);

    var uri = Uri.parse('https://eco.prosoft.kg/api/freedom/pay');
    print(json);
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://eco.prosoft.kg/api/freedom/pay'));
    String sumTemp = '';
    String sumTempFirst = json['sum'].toString();
    print(sumTempFirst);
    for (var i = 0; i < sumTempFirst.length - 2; i++) {
      sumTemp = sumTemp + sumTempFirst[i];
    }
    print(sumTemp);
    request.fields.addAll({
      'type': json['type'],
      'test_id': '0',
      'phone': json['phone'],
      'email': json['email'],
      'company_director': json['company_director'],
      'sum': sumTemp,
      'company_name': json['company_name'],
      'company_area': json['company_area'],
      'region': json['region']
    });

    var headers = {
      'Authorization': 'Bearer FtVcU6CpHD1rBjuYu6luWDA0ILuK1tVv',
    };

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsed = await http.Response.fromStream(response);
    json['sum'] = json['sum'].toString();
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return responsed.body;
    } else if (response.statusCode == 400) {
      print('error not found');
      print(jsonDecode(responsed.body));
      return 'false';
      //throw exception and catch it in UI
    } else {
      print('error not found');
      print(responsed.body);
      return 'false';
      //throw exception and catch it in UI
    }
    /*var response = await http2.post(uri, body: json, headers: {
      HttpHeaders.authorizationHeader: "Bearer FtVcU6CpHD1rBjuYu6luWDA0ILuK1tVv"
      */ /*'Authorization': 'Bearer FtVcU6CpHD1rBjuYu6luWDA0ILuK1tVv',*/ /*
    });
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return response.body;
    } else if (response.statusCode == 400) {
      print('error not found');
      print(response.body);
      return 'false';
      //throw exception and catch it in UI
    } else {
      print('error not found');
      print(response.body);
      return 'false';
      //throw exception and catch it in UI
    }*/
  }

  Future<bool> postProfileEdit(var json) async {
    //var _payload = json.encode(object);

    var uri = Constants.addPathToBaseUrl('User/UpdateProfile');
    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
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

  Future<dynamic> getProfileProducts(String email) async {
    // email=email.replaceAll('@', '%40');

    var uri = Constants.addPathToBaseUrl('Products/Index',
        queryParameters: {'email': email});

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

  Future<dynamic> getUserData(String email) async {
    var uri = Constants.addPathToBaseUrl('/User/GetProfile',
        queryParameters: {'Email': email});
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

  Future<bool> getConfirmEmail(String email) async {
    //var _payload = json.encode(object);

    email = email.replaceAll('@', '%40');
    print(email);

    var url = Uri.parse(
        'http://${Constants.host}/User/SendCodeWordToEmailToConfirmEmail?email=$email');
    var uri = Uri(
      scheme: 'http',
      host: ip,
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

  Future<bool> postConfirmEmail(String email, String kod) async {
    //var _payload = json.encode(object);

    Map<String, String> json = {"secretWord": kod, "email": email};

    var uri = Constants.addPathToBaseUrl('User/ConfirmEmail');

    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
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

    var uri = Constants.addPathToBaseUrl('Products/AddWithEmail');
    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);

      var data = jsonDecode(response.body);
      var inner = data['data'];
      var id = inner['id'];
      var type = id.runtimeType;
      return id;
    } else {
      print('error not found');
      print(response.body);
      return 0;
      //throw exception and catch it in UI
    }
  }

  Future<int> postProductUpdate(var json) async {
    //var _payload = json.encode(object);

    var uri = Constants.addPathToBaseUrl('/Products/Update');
    var response = await client.post(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
    print(response.statusCode);
    if (response.statusCode == 201 || response.statusCode == 200) {
      print(response.statusCode);
      return 1;
    } else {
      print('error not found');
      print(response.body);
      return 0;
      //throw exception and catch it in UI
    }
  }

  Future<bool> postProductImagesDelete(var productId) async {
    //var _payload = json.encode(object);
    var json = {"productId": productId};
    var uri =
        Constants.addPathToBaseUrl('/ProductImage/DeleteImagesByProductId');
    var response = await client.delete(uri,
        body: jsonEncode(json),
        headers: {"Content-Type": "application/json", "Accept": "*/*"});
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

  Future<bool> postProductPhotoAdd(List<XFile> file, int id) async {
    var uri = Constants.addPathToBaseUrl('ProductImage/AddImage/$id');
    var request = http.MultipartRequest('POST', uri);

//for image and videos and files

// request.files.add(await http.MultipartFile.fromPath("images", path));
    for (var i = 0; i < file.length; i++) {
      var fileBytes$i = await file[i].readAsBytes();
      var httpImage$i = http.MultipartFile.fromBytes(
          'Images', fileBytes$i.toList(),
          contentType: MediaType('image', 'jpeg'), filename: file[i].name);

//for completeing the request
      request.files.add(httpImage$i);
    }
    var response = await request.send();

//for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
// final responseData = json.decode();

    if (response.statusCode == 200) {
      print("SUCCESS");
      print(responsed.body);
      return true;
    } else {
      print(response.statusCode);
      print(responsed.body);
      print("ERROR");
      return false;
    }
  }

  Future<bool> postProfilePhotoAdd(XFile file, String email,
      [bool update = false]) async {
    var uri = Constants.addPathToBaseUrl('User/ProfileAvatar',
        queryParameters: update
            ? {'email': email, 'updateDelete': 'true'}
            : {'email': email});

    print(uri);
    var request = http.MultipartRequest('POST', uri);

//for image and videos and files

// request.files.add(await http.MultipartFile.fromPath("images", path));
    final fileBytes = await file.readAsBytes();
    final httpImage = http.MultipartFile.fromBytes('Avatar', fileBytes.toList(),
        contentType: MediaType('image', 'jpeg'), filename: file.name);
//for completeing the request
    request.files.add(httpImage);
    var response = await request.send();

//for getting and decoding the response into json format
    var responsed = await http.Response.fromStream(response);
// final responseData = json.decode();

    if (response.statusCode == 200) {
      print("SUCCESS photoprofile add");
      print(responsed.body);
      return true;
    } else {
      print(response.statusCode);
      print(responsed.body);
      print("ERROR photo profile");
      return false;
    }
  }

  Future addCollective(int productId, String buyerEmail) async {
    var uri =
        Constants.addPathToBaseUrl('GroupDiscount/AddGroupDiscountProduct');
    Map<String, dynamic> obj = {
      'productId': productId,
      'buyerEmail': buyerEmail,
    };

    var json = jsonEncode(obj);
    var response = await client.post(
      uri,
      body: json,
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if (response.statusCode != 200) {
      throw Exception("Не удалось добавить в список коллективной покупки");
    }
  }

  Future removeCollective(int productId, String buyerEmail) async {
    var uri =
        Constants.addPathToBaseUrl('GroupDiscount/RemoveGroupDiscountProduct');
    Map<String, dynamic> data = {
      'productId': productId,
      'buyerEmail': buyerEmail,
    };
    var response = await client.delete(
      uri,
      body: jsonEncode(data),
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if (response.statusCode != 200) {
      throw Exception("Не удалось удалить в список коллективной покупки");
    }
  }

  Future makeCollective(MakingCollectiveProduct argument) async {
    var uri =
        Constants.addPathToBaseUrl('GroupDiscount/MakeProductGroupDiscount');

    var json = jsonEncode(argument.toMap());
    // Map<String, dynamic> data = argument.toMap();
    var response = await client.post(
      uri,
      body: json,
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if (response.statusCode != 200) {
      throw Exception(
          "Не удалось добавить в список товаров коллективной покупки");
    }
  }

  Future unmakeCollective(UnmakeCollectiveArgument argument) async {
    var uri =
        Constants.addPathToBaseUrl('GroupDiscount/UnmakeProductGroupDiscount');
    // Map<String, dynamic> data = argument.toMap();
    var response = await client.delete(
      uri,
      body: jsonEncode(argument.toMap()),
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if (response.statusCode != 200) {
      throw Exception(
          "Не удалось убрать из список товаров коллективной покупки");
    }
  }

  Future submitCollective(SubmitCollectiveArgument argument) async {
    var uri = Constants.addPathToBaseUrl('GroupDiscount/SubmitDeal');
    var response = await client.post(
      uri,
      body: argument.toJson(),
      headers: {"Content-Type": "application/json", "Accept": "*/*"},
    );
    if (response.statusCode != 200) {
      throw Exception(jsonDecode(response.body));
    }
  }
}
