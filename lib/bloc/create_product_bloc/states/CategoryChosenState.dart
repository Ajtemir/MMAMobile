import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:upai_app/bloc/create_product_bloc/base_create_product_state.dart';
import 'package:upai_app/model/auction/auction_bloc/api/execute_result.dart';
import 'package:upai_app/utilities/app_http_client.dart';

import '../../../shared/app_colors.dart';

class CategoryChosenState extends BaseCreateProductState {
  final int categoryId;
  final int productId;
  var set = <int>{};

  CategoryChosenState(this.categoryId, this.productId);

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
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            var elements = snapshot.data!.single!.propertyKeys.map((element) {
              switch (element.isMultiple) {
                case true:
                  return multipleSelect(element);
                case false:
                  return singleSelect(element);
                case null:
                  return literal(element);
                default:
                  throw Exception("");
              }
            });
            print(snapshot.data!.single.toString());
            return Column(
              children: elements.expand((element) => element).toList(),
            );
          }
          return Center(
            child: Text(categoryId.toString()),
          );
        });
  }

  List<Widget> multipleSelect(PropertyKey element) {
    return [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(
          element.name,
          style: const TextStyle(
              color: Color(0xFF515151),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      MultiSelectDropDown(
        onOptionSelected: (List<ValueItem> selectedOptions) {
          for (var option in selectedOptions) { set.add(int.parse(option.value!)); }
          print('start');
          set.forEach((element) {print(element);});
          print('end');
        },
        options: element.propertyKeyValues.map((e) => ValueItem(label: e.name, value: e.id.toString())).toList(),
        selectionType: SelectionType.multi,
        chipConfig: const ChipConfig(wrapType: WrapType.wrap),
        dropdownHeight: 300,
        optionTextStyle: const TextStyle(fontSize: 16),
        selectedOptionIcon: const Icon(Icons.check_circle),
      ),
    ];
  }

  List<Widget> singleSelect(PropertyKey element){
    return [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(element.name,
          style: TextStyle(
              color: Color(0xFF515151),
              fontSize: 16,
              fontWeight: FontWeight.w400),
        ),
      ),
      DropdownButtonFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AppColors.blue,
              )),
          hintText: element.name,
          hintStyle: TextStyle(
            color: Color(0xFFA6A6A6),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        items: [
          DropdownMenuItem(
            child: Text("Не выбран"),
            value: 0,
          ),
          ...element.propertyKeyValues.map(
                (e) => DropdownMenuItem(
              child: Text(e.name),
              value: e.id,
            ),
          )
        ],
        onChanged: (e)
        {
          set.add(e as int);
          print('start');
          set.forEach((element) {print(element);});
          print('end');
        },
      )
    ];
  }

  List<Widget> literal(PropertyKey element){
    return [
      const SizedBox(height: 10),
      Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(element.name,
          style: const TextStyle(
            color: Color(0xFF515151),
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 19),
        height: 45,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          // controller: name,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            // for below version 2 use this
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
// for version 2 and greater youcan also use this
            FilteringTextInputFormatter.digitsOnly

          ],
          decoration: InputDecoration(
            contentPadding:
            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            border: InputBorder.none,
            hintText: element.name,
            hintStyle: TextStyle(
              color: Color(0xFFA6A6A6),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      )
    ];
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
