import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:upai_app/views/category/filter.dart';
import 'package:upai_app/widgets/appBar.dart';

import '../../shared/app_colors.dart';

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kIsWeb ? null : AllAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 14, top: kIsWeb ? 50 : 5),
        children: [
          ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Filter(
                      category: '',
                    ))),
            leading: Text('Категории',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400)),
            trailing: Image.asset(
              'assets/img/category_page/filterIcon.png',
              width: 20,
              height: 18,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: Text(
              'Кухня и еда',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
          ),
          Container(
            height: 213,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SlideContainer(0, 5, 193, 'Ресторан Дияр', 25),
                SizedBox(width: 10),
                SlideContainer(1, 4, 148, 'Ресторан Кайн', 16),
                SizedBox(width: 10),
                SlideContainer(2, 4, 95, 'Ресторан Кайнар', 16)
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: Text(
              'Кино и театры',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
          ),
          Container(
            height: 138,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SlideContainerTwo(3, 4.3, 371, 'Cinematica', 25),
                SizedBox(width: 10),
                SlideContainerTwo(4, 4, 93, 'Brodway cinema', 16),
                SizedBox(width: 10),
                SlideContainerTwo(5, 5, 109, 'Manas cinema', 16)
              ],
            ),
          ),
          SizedBox(height: 40),
          Stack(
            fit: StackFit.passthrough,
//            overflow: Overflow.clip,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  height: 170,
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFF313131),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0x40000000).withOpacity(0.25),
                            blurRadius: 10,
                            offset: Offset(0, 6))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 17,
                              right: 143,
                            ),
                            child: Text(
                              'Пейнтбольный клуб “Skorpion”',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(height: 7),
                          Padding(
                            padding: const EdgeInsets.only(right: 180),
                            child: Text(
                              "Чем больше команда, тем больше  кешбек",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            height: 31,
                          ),
                          SizedBox(
                            height: 8,
                          )
                        ]),
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 10,
                  child: Image.asset(
                    'assets/img/category_page/paintball.png',
                    width: 220,
                  )),
              Positioned(
                left: 12,
                bottom: 9,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/img/category_page/procentContIcon.png')),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('15%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ),
                ),
              ),
              Positioned(
                left: 9,
                bottom: 13,
                child: Container(
                  padding: EdgeInsets.all(3),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/img/category_page/procentIcon.png',
                      width: 10, height: 10),
                ),
              )
            ],
          ),
          SizedBox(height: 20),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: Text(
              'Одежда и обувь',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
          ),
          Container(
            height: 213,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SlideContainer(6, 5, 193, 'LC waikiki', 25),
                SizedBox(width: 10),
                SlideContainer(7, 4.8, 148, 'Hugo BOSS', 16),
                SizedBox(width: 10),
                SlideContainer(8, 5, 180, 'Lion', 16)
              ],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: Text(
              'Развлечение',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
          ),
          Container(
            height: 138,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SlideContainerTwo(9, 4.6, 371, 'Иллюзион', 25),
                SizedBox(width: 10),
                SlideContainerTwo(10, 3.9, 93, 'Brodway cinema', 16),
                SizedBox(width: 10),
                SlideContainerTwo(11, 5, 293, 'Manas cinema', 16)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SlideContainer(
      int image, double rat, int otzyv, String name, int kesh) {
    return GestureDetector(
      onTap: () {},
      /*=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AboutMagaz())),*/
      child: Container(
        width: 150,
        child: Column(
          children: [
            Stack(children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2.5, color: Color(0xFF929292).withOpacity(0.37)),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 7,
                          offset: Offset(0, 6),
                          color: Color(0x33000000))
                    ],
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage('assets/img/category_page/$image.jpg'))),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'assets/img/category_page/procentContIcon.png')),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text('15%',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        )),
                  ),
                ),
              ),
              Positioned(
                right: 37,
                top: 30,
                child: Container(
                  padding: EdgeInsets.all(3),
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset('assets/img/category_page/procentIcon.png',
                      width: 10, height: 10),
                ),
              )
            ]),
            SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(color: Color(0xFF313131), fontSize: 12),
                    ),
                    Row(
                      children: [
                        RatingBar.builder(
                            allowHalfRating: true,
                            initialRating: rat,
                            itemSize: 10,
                            itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: AppColors.mainRed,
                                ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                rat = rating;
                              });
                            }),
                        SizedBox(width: 2.5),
                        Text(
                          '$rat',
                          style:
                              TextStyle(color: AppColors.mainRed, fontSize: 10),
                        ),
                        SizedBox(width: 2),
                        Text(
                          '($otzyv отзыва)',
                          style:
                              TextStyle(color: Color(0xFF313131), fontSize: 10),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget SlideContainerTwo(
      int image, double rat, int otzyv, String name, int kesh) {
    return Container(
      width: 150,
      child: Column(
        children: [
          Stack(children: [
            Container(
              width: 150,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2.5, color: Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 7,
                        offset: Offset(0, 6),
                        color: Color(0x33000000))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/img/category_page/$image.jpg'))),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/img/category_page/procentContIcon.png')),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('15%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      )),
                ),
              ),
            ),
            Positioned(
              right: 37,
              top: 30,
              child: Container(
                padding: EdgeInsets.all(3),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/img/category_page/procentIcon.png',
                    width: 10, height: 10),
              ),
            )
          ]),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Color(0xFF313131), fontSize: 12),
                  ),
                  Row(
                    children: [
                      RatingBar.builder(
                          initialRating: rat,
                          itemSize: 10,
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: AppColors.mainRed,
                              ),
                          onRatingUpdate: (rating) {
                            setState(() {
                              rat = rating;
                            });
                          }),
                      SizedBox(width: 2.5),
                      Text(
                        '$rat',
                        style:
                            TextStyle(color: AppColors.mainRed, fontSize: 10),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '($otzyv отзыва)',
                        style:
                            TextStyle(color: Color(0xFF313131), fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
