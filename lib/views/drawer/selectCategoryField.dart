import 'package:flutter/material.dart';

import '../../model/auction/auction_bloc/api/execute_result.dart';
import '../../utilities/app_http_client.dart';
import '../category/selectCategoty.dart';

class SelectCategoryField extends StatefulWidget {
  const SelectCategoryField({Key? key}) : super(key: key);

  @override
  State<SelectCategoryField> createState() => _SelectCategoryFieldState();
}

class Category {
  final int id;
  final String name;
  final List<Category> subCategories;

  Category(this.id, this.name, this.subCategories);

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        subCategories = json['subCategories'].map((x) {
          return Category.fromJson(json);
        });
}

class _SelectCategoryFieldState extends State<SelectCategoryField> {
  int currentCategoryId = 1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ExecuteResult<Category>>(
        future: AppHttpClient.execute(
            HttpMethod.get,
            '/Reduction/Get',
            {
              'productId': currentCategoryId,
            },
            dataConstructor: Category.fromJson),
        builder: (context, snapshot) {
          snapshot.data.single.
        });

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 19.0),
          child: Text('Категория',
              style: TextStyle(
                  color: Color(0xFF515151),
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        SizedBox(height: 7),
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SelectCategory())),
          child: Container(
              padding: EdgeInsets.only(left: 19,top: 13),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              Provider.of<SelectCatProvider>(context).category == ''
                  ? Text('Выберите категорию',
                  style: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))
                  : Text(
                  Provider.of<SelectCatProvider>(context)
                      .category,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))),
        )
      ],
    );
  }
}
