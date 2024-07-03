import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../model/productModel.dart';

Future<ListProductsModel> fetchProducts() async {
  final response = await AuthClient().getProducts();

    return ListProductsModel.fromJson(jsonDecode(response));
}
