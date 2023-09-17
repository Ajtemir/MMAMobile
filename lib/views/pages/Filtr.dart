import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/provider/selectCatProvider.dart';
import 'package:upai_app/provider/selectTabProvider.dart';
import 'package:upai_app/shared/app_colors.dart';
import 'package:upai_app/views/category/mestopolojenia.dart';
import 'package:upai_app/views/category/selectCategoty.dart';

class Filtr extends StatefulWidget {
  const Filtr({Key? key}) : super(key: key);

  @override
  State<Filtr> createState() => _FiltrState();
}

class _FiltrState extends State<Filtr> {
  bool _krugIcon = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Фильтр"),
        iconTheme: IconThemeData(color: Colors.black //change your color here
            ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                "Очистить",
                style: TextStyle(color: Color.fromARGB(255, 72, 179, 127)),
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Поиск",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder()),
                ),
              ),
              Text(
                "Категория",
                style: TextStyle(fontSize: 15),
              ),
              SizedBox(height: 7),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SelectCategory())),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                                  ))
                        ],
                      )),
                ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: TextButton(
              //       style: ButtonStyle(
              //         backgroundColor: MaterialStateProperty.all(Colors.white),
              //         foregroundColor: MaterialStateProperty.all(
              //             Color.fromARGB(255, 104, 97, 97)),
              //         minimumSize: MaterialStateProperty.all(Size(280, 45)),
              //         shape: MaterialStateProperty.all<OutlinedBorder>(
              //           RoundedRectangleBorder(
              //             side: BorderSide(color: Colors.black, width: 0.8),
              //           ),
              //         ),
              //       ),
              //       onPressed: () {},
              //       child: Row(
              //         children: [
              //           Text("Выберите категорию "),
              //         ],
              //       )),
              // ),
              Text(
                "Местоположение ",
                style: TextStyle(fontSize: 15),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Mestapolojenia())),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Provider.of<SelectCatProvider>(context).category == ''
                              ? Text('Выберите местоположение',
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
                                  ))
                        ],
                      )),
                ),
              ),
              Text("Цена"),
              SizedBox(
                height: 100,
              ),
              Text("Сортировать"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 104, 97, 97)),
                      minimumSize: MaterialStateProperty.all(Size(280, 45)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("По умолчанию "),
                        SizedBox(
                          width: 210,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _krugIcon = false;
                              });
                            },
                            child: Image.asset(
                              "assets/img/krugIcon.png",
                              color: Provider.of<SelectTabProvider>(context)
                                          .currentTab ==
                                      _krugIcon
                                  ? Colors.red
                                  : Colors.green,
                              width: 15,
                              height: 15,
                            ))
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 104, 97, 97)),
                      minimumSize: MaterialStateProperty.all(Size(280, 45)),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Text("Сначала новые "),
                        SizedBox(
                          width: 205,
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _krugIcon = false;
                              });
                            },
                            child: Image.asset(
                              "assets/img/krugIcon.png",
                              color: Provider.of<SelectTabProvider>(context)
                                          .currentTab ==
                                      _krugIcon
                                  ? null
                                  : Colors.green,
                              width: 15,
                              height: 15,
                            ))
                      ],
                    )),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
