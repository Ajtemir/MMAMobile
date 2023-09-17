import 'dart:convert';

import 'package:upai_app/service/service.dart';
import '../model/categoriesModel.dart';

Future<CategoriesModel> fetchCategories() async {
  final response = await AuthClient().getCategories();

  return CategoriesModel.fromJson(jsonDecode(response));
}
