import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upai_app/bloc/create_product_bloc/create_product_page.dart';
import 'package:upai_app/bloc/create_product_bloc/create_product_bloc.dart';
import 'package:upai_app/bloc/create_product_bloc/create_product_events.dart';

import '../../constants/constants.dart';
import '../../model/auction/auction_bloc/api/execute_result.dart';
import '../../model/categoriesModel.dart';
import '../../shared/app_colors.dart';
import '../../utilities/app_http_client.dart';
import '../../widgets/appBar2.dart';
import '../category/selectCategoty.dart';
import 'hotKeshAdd.dart';

class SelectCategoryField extends StatefulWidget {
  const SelectCategoryField({Key? key}) : super(key: key);

  @override
  State<SelectCategoryField> createState() => _SelectCategoryFieldState();
}

class Category {
  final int id;
  final String name;
  final String image;
  final List<Category> subCategories;

  Category(this.id, this.name, this.subCategories, this.image);

  Category.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        image = json['imagePath'],
        subCategories = json['subCategories'].map<Category>((x) {
          return Category.fromJson(x);
        }).toList();
}

class _SelectCategoryFieldState extends State<SelectCategoryField> {
  late int _popCount = 0;
  Category? currentCategory;

  @override
  Widget build(BuildContext context) {
    return categoriesInput();
  }

  Widget categoriesInput() {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 19.0),
          child: Text('Категория',
              style: TextStyle(
                  color: Color(0xFF515151),
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
        ),
        const SizedBox(height: 7),
        GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => CategoriesList(currentCategoryId: 1,))),
          child: Container(
              padding: const EdgeInsets.only(left: 19,top: 13),
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.blue),
                borderRadius: BorderRadius.circular(10),
              ),
              child:
              currentCategory == null
                  ? Text('Выберите категорию',
                  style: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))
                  : Text(
                  currentCategory!.name,
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ))),
        )
      ],
    );
  }

  Widget CategoriesList({int currentCategoryId = 1}){
    return Scaffold(
      appBar: AllAppBar2(),
      body:
      FutureBuilder<ExecuteResult<Category>>(
          future: AppHttpClient.execute(
              HttpMethod.get,
              '/Categories/GetCategoryById',
              {
                'categoryId': currentCategoryId.toString(),
              },
              dataConstructor: Category.fromJson),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var category = snapshot.data!.single!;
            var length = category.subCategories.length;
            var categories = category.subCategories;
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              separatorBuilder: (context, _) => SizedBox(height: 10),
              itemCount: length,
              itemBuilder: (context, index) => CategoryWidget(
                  categories[index].name,
                  categories[index].image,
                  categories[index].id,
                  categories[index].subCategories.isNotEmpty),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return Center(child:  CircularProgressIndicator());
        },),


    );
  }


  Widget CategoryWidget(String name, String image, int catId, bool hasSubs) {
    print(hasSubs);
    return GestureDetector(
      onTap: (){
        if(hasSubs){
          _popCount++;
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoriesList(currentCategoryId: catId,)));
        }
        else{
          for(int i=0;i<=_popCount;i++) Navigator.of(context).pop();
          BlocProvider.of<CreateProductBloc>(context).add(ChooseCategoryEvent(catId));
        }
      },
      child: Container(
        width: 65,
        height: 65,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x1A000000).withOpacity(0.1),
                        blurRadius: 4,
                        offset: Offset(0, 4)),
                  ],
                  border: Border.all(
                      width: 0.5, color: Color(0xFF929292).withOpacity(0.37)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Image.network(
                  Constants.addPartToBaseUrl(image),
                  height: 22,
                  width: 22,
                ),
              ),
            ),
            SizedBox(width: 30),
            Text(
              name,
              style: TextStyle(color: Colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }


}
