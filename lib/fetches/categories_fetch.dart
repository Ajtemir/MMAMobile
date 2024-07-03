import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:upai_app/views/auth/server/service.dart';

import '../model/categoriesModel.dart';
import '../model/productModel.dart';

Future<CategoriesModel> fetchCategories() async {
  final response = await AuthClient().getCategories();

    return CategoriesModel.fromJson(jsonDecode(response));
}
