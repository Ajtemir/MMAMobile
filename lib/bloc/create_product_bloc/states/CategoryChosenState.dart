import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
  import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upai_app/bloc/create_product_bloc/base_create_product_state.dart';
import 'package:upai_app/model/auction/auction_bloc/api/execute_result.dart';
import 'package:upai_app/user/userData.dart';
import 'package:upai_app/utilities/app_http_client.dart';

import '../../../provider/selectCatProvider.dart';
import '../../../shared/app_colors.dart';
import '../../../views/category/aboutMagaz.dart';

class CategoryChosenState extends BaseCreateProductState {
  final int categoryId;
  final int productId;
  var set = <int>{};
  late List<PropertyKey?>? properties;

  CategoryChosenState(this.categoryId, this.productId);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<ExecuteResult<PropertyKey>>(
        future: AppHttpClient.execute(
            HttpMethod.get,
            '/Products/GetProductPropertiesByProductId',
            {
              'productId': productId.toString(),
            },
            dataConstructor: PropertyKey.fromJson,
            isList: true,
        ),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            properties = snapshot.data!.data;
            var elements = snapshot.data!.data!.map((element) {
              switch (element?.isMultipleOrLiteralDefault) {
                case true:
                  return multipleSelect(element!);
                case false:
                  return singleSelect(element!);
                case null:
                  return literal(element!);
                default:
                  throw Exception("");
              }
            });
            elements = [...elements,
              [
                if(Provider.of<SelectCatProvider>(context, listen: false).email==UserData.userEmail || UserData.userEmail=='')
                Padding(
              padding: const EdgeInsets.only(top: 70.0),
              child: InkWell(
                onTap: (){
                  properties!.forEach((element) async {
                    switch(element?.isMultipleOrLiteralDefault){
                      case true:
                        print(element!.currentMultiValues.join(' '));
                        break;
                      case false:
                        print(element!.currentSingleValue);
                        break;
                      case null:
                        print(element!.currentNumberValue);
                        break;
                    }
                    await AppHttpClient.execute(HttpMethod.post, '/Products/UpdateProperties/${productId}', {'properties': properties?.map((e) => e!.toMap()).toList()});
                    var prefs = await SharedPreferences.getInstance();
                    var email = prefs.getString('email');
                    // print(email);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => AboutMagaz(productId: productId.toString(),email: email!,checkUserPage: false,)));
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110.0),
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.red1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Отправить',style: TextStyle(color: Colors.white,fontSize: 14),)),
                  ),
                ),
              ),
            )]];
            print(snapshot.data!.single.toString());
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: elements.expand((element) => element).toList(),
                  ),
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  List<Widget> multipleSelect(PropertyKey element) {
    var options = element.propertyKeyValues.map((e) => ValueItem(label: e.name, value: e.id.toString())).toList();
    var selected = options.where((x) => element.currentMultiValues.contains(int.parse(x.value!))).toList();
    var multi = MultiSelectDropDown(
      selectedOptions: selected,
      // selectedOptions: element.propertyKeyValues.where((x) => element.currentMultiValues.contains(x.id)).map((e) => ValueItem(label: e.name, value: e.id.toString())).toList(),
      // selectedOptions: element.propertyKeyValues.map((e) => ValueItem(label: e.name, value: e.id.toString())).toList().where((x) => element.currentMultiValues.contains(int.parse(x.value!))).toList(),
      onOptionSelected: (List<ValueItem> selectedOptions) {
        properties!.where((e) => e!.id == element.id).first?.currentMultiValues =
        selectedOptions.map((e) => int.parse(e.value!)).toList();
        for (var option in selectedOptions) { set.add(int.parse(option.value!)); }
        print('start');
        set.forEach((element) {print(element);});
        print('end');
      },
      options: options,
      selectionType: SelectionType.multi,
      chipConfig: const ChipConfig(wrapType: WrapType.wrap),
      dropdownHeight: 300,
      optionTextStyle: const TextStyle(fontSize: 16),
      selectedOptionIcon: const Icon(Icons.check_circle),

    );
    return [
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(
          element.name,
          style: const TextStyle(
              color: Color(0xFF515151),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
      multi,
    ];
  }

  List<Widget> singleSelect(PropertyKey element){
    return [
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(element.name,
          style: TextStyle(
              color: Color(0xFF515151),
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
      ),
      DropdownButtonFormField(
        value: element.currentSingleValue,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 5,
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
          properties!.where((e) => e!.id == element.id).first?.currentSingleValue =
              e as int;
          set.add(e as int);
          print('start');
          set.forEach((element) {print(element);});
          print('end');
        },
      )
    ];
  }

  List<Widget> literal(PropertyKey element){
    final TextEditingController emailController = element.currentNumberValue == null ? TextEditingController() : TextEditingController(text: element.currentNumberValue.toString());
    return [
      const SizedBox(height: 30),
      Padding(
        padding: const EdgeInsets.only(left: 19.0),
        child: Text(element.name,
          style: const TextStyle(
            color: Color(0xFF515151),
            fontSize: 18,
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
          controller: emailController,
          // controller: name,
          onChanged: (e) =>{
          properties!.where((e) => e!.id == element.id).first?.currentNumberValue =
          int.parse(e)
          },
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
  final bool? isMultipleOrLiteralDefault;
  final int id;
  final String name;
  final List<PropertyKeyValue> propertyKeyValues;
  late List<int> currentMultiValues;
  late int? currentSingleValue;
  late int? currentNumberValue;

  Map<String, dynamic> toMap(){
    return {
      'isMultipleOrLiteralDefault': isMultipleOrLiteralDefault,
      'id': id,
      'name':name,
      'currentNumberValue': currentNumberValue,
      'currentSingleValue': currentSingleValue,
      'currentMultiValues': currentMultiValues,
    };
  }

  String toJson(){
    return jsonEncode(toMap());
  }

  PropertyKey.fromJson(Map<String, dynamic> json)
      : isMultipleOrLiteralDefault = json['isMultipleOrLiteralDefault'],
        id = json['id'],
        name = json['name'],
        currentNumberValue = json['currentNumberValue'],
        currentMultiValues = json['currentMultiValues'].map<int>((x)=>x as int).toList(),
        currentSingleValue = json['currentSingleValue'],
        propertyKeyValues = json['propertyValues']
            .map<PropertyKeyValue>((x) => PropertyKeyValue.fromJson(x))
            .toList();

  PropertyKey(this.isMultipleOrLiteralDefault, this.id, this.name,
      this.currentNumberValue,
      this.currentMultiValues,
      this.currentSingleValue,
      this.propertyKeyValues);
}

class PropertyKeyValue {
  final int id;
  final String name;

  PropertyKeyValue(this.id, this.name);

  PropertyKeyValue.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'];
}
