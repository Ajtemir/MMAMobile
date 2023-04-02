import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/provider/selectCatProvider.dart';
import 'package:upai_app/widgets/appBar2.dart';

import 'filter.dart';

class SelectCategory extends StatefulWidget {
  const SelectCategory({Key? key}) : super(key: key);

  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {

  List<String> CategoryName = [
    'Магазины',
    'Активный отдых',
    'Кино и театры',
    'Кафе и рестораны',
    'Для детей',
    'Игровые клубы',
    'Сауны и бани',
    'Отели и хостелы',
    'Аптеки',
    'Автоуслуги и товары',
    'Косметика и парфюмерия',
    'Оптика',
    'Аксессуары',
    'Товары для дома',
    'Ювелирные изделия',
    'Красота и здровье',
    'SPA и косметология',
    'Химчистка',
    'Зоомагазины',
    'Другое',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 14),
        separatorBuilder: (context, _) => SizedBox(height: 10),
        itemCount: CategoryName.length,
        itemBuilder: (context, index) => Category(
            CategoryName[index], 'assets/img/category/cat$index.png'),
      ),
    );
  }
  Widget Category(String name, String image) {
    return GestureDetector(
      onTap: (){
        Provider.of<SelectCatProvider>(context,listen: false).toggleSelect(name);
        Navigator.pop(context);
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
                child: Image.asset(
                  image,
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
