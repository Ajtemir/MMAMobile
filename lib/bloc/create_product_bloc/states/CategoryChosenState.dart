import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:upai_app/bloc/create_product_bloc/base_create_product_state.dart';
import 'package:upai_app/model/auction/auction_bloc/api/execute_result.dart';
import 'package:upai_app/utilities/app_http_client.dart';

class CategoryChosenState extends BaseCreateProductState {
  final int categoryId;

  CategoryChosenState(this.categoryId);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExecuteResult<CategoryPropertyDetail>>(
        future: AppHttpClient.execute(
            HttpMethod.get,
            '/Categories/GetCategoryPropertiesAndTheirValues',
            {
              'categoryId': categoryId.toString(),
            },
            dataConstructor: CategoryPropertyDetail.fromJson),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            
            print(snapshot.data!.single.toString());
          }
          return Center(child: Text(categoryId.toString()),);
        });
  }
}

class CategoryPropertyDetail {
  final String categoryName;
  final int categoryId;
  final List<PropertyKey> propertyKeys;

  CategoryPropertyDetail(this.categoryName, this.categoryId, this.propertyKeys);

  CategoryPropertyDetail.fromJson(Map<String, dynamic> json)
      : categoryName = json['categoryName'],
        categoryId = json['categoryId'],
        propertyKeys =
            json['propertyKeys'].map<PropertyKey>((x) => PropertyKey.fromJson(x)).toList();
}

class PropertyKey {
  final bool? isMultiple;
  final int id;
  final String name;
  final List<PropertyKeyValue> propertyKeyValues;

  PropertyKey.fromJson(Map<String, dynamic> json)
      : isMultiple = json['isMultiple'],
        id = json['id'],
        name = json['name'],
        propertyKeyValues = json['propertyKeyValues']
            .map<PropertyKeyValue>((x) => PropertyKeyValue.fromJson(x))
            .toList();

  PropertyKey(this.isMultiple, this.id, this.name, this.propertyKeyValues);
}

class PropertyKeyValue {
  final int id;
  final String name;

  PropertyKeyValue(this.id, this.name);

  PropertyKeyValue.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
