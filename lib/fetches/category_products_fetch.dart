import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../model/productModel.dart';

Future<ListProductsModel> fetchCategoryProducts(String id) async {
  final response = await AuthClient().getCategoryProducts(id);

    return ListProductsModel.fromJson(jsonDecode(response));
}
