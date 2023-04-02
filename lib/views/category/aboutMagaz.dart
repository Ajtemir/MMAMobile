import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../shared/app_colors.dart';
import 'custom_navigation.dart';
import 'full_screen_album.dart';

class AboutMagaz extends StatefulWidget {
  const AboutMagaz({Key? key}) : super(key: key);

  @override
  _AboutMagazState createState() => _AboutMagazState();
}

class _AboutMagazState extends State<AboutMagaz> {
  String comment =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua tempor incididunt ut labore et dolore ''';
  List<String> userComment = [
    'Азим Дженалиев',
    'Елена Ворон',
    'Дмитрий Воробьев'
  ];

  @override
  Widget build(BuildContext context) {
    String aboutUs =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ''';
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 14),
        children: [
          Row(
            children: [
              Container(
                width: 142,
                height: 142,
                padding: EdgeInsets.all(9),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5,
                          offset: Offset(0, 0),
                          color: Color(0x26000000))
                    ]),
                child: Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5,
                            offset: Offset(0, 0),
                            color: Color(0x26000000))
                      ]),
                  child: Stack(
                    //overflow: Overflow.visible,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 0.5,
                              color: Color(0xFF929292).withOpacity(0.37)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 16,
                                offset: Offset(0, 0),
                                color: Color(0x33000000))
                          ],
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  AssetImage('assets/img/category_page/0.jpg')),
                        ),
                      ),
                      Positioned(
                        right: -10,
                        top: -10,
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
                        right: 22,
                        top: 15,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          width: 16,
                          height: 16,
                          decoration: BoxDecoration(
                            color: AppColors.green,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                              'assets/img/category_page/procentIcon.png',
                              width: 10,
                              height: 10),
                        ),
                      )
                      // Positioned(
                      //   top: 0,
                      //   right: 72,
                      //   child: Container(
                      //     padding: EdgeInsets.all(9),
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       color: Color(0xFFFF6B00),
                      //     ),
                      //     child: Image.asset(
                      //       'assets/img/penIcon.png',
                      //       width: 15,
                      //       height: 15,
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Вкус Азии',
                    style: TextStyle(
                      color: Color(0xFF313131),
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 17),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x26000000),
                                  offset: Offset(0, 1),
                                  blurRadius: 4)
                            ]),
                        child: Center(
                          child: Image.asset(
                              'assets/img/category_page/phoneIcon1.png'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        '+996 555 123 456',
                        style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color(0x26000000),
                                  offset: Offset(0, 1),
                                  blurRadius: 4)
                            ]),
                        child: Center(
                          child: Image.asset(
                              'assets/img/category_page/instaIcon1.png'),
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        '@instagramname',
                        style: TextStyle(
                            color: Color(0xFF535353),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 48),
          Text(
            'О нас',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 10),
          Text(
            aboutUs,
            style: TextStyle(
              color: Color(0xFF515151),
              fontSize: 14,
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFF6B00),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        'assets/img/category_page/homeIcon.png',
                        width: 15,
                        height: 15,
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'Поделиться заведением',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  ],
                )),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(20),
            height: 132,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Color(0xFF929292).withOpacity(0.37)),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: Offset(0, 4))
                ]),
            child: Wrap(
              runSpacing: 16,
              direction: Axis.horizontal,
              children: [
                infoWidget('phone', '+996 555 123 456'),
                infoWidget('insta', '@instagramname'),
                infoWidget('map', 'ул. Токтогула 214 б'),
                infoWidget('web', 'www.sitename.name'),
                infoWidget('calendar', 'Сегодня с 9:00 - 21:00'),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            'Галерея',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 13),
          Container(
            height: 215,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                        MyCustomRoute(
                            builder: (context) => FullScreenAlbum(index)));
                  },
                  child: Container(
                    width: 146,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                                'assets/img/category_page/galery/$index.png'))),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 69),
          Text(
            'Отзывы',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 21),
          Container(
            height: 350,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: userComment.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (BuildContext context, int index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/img/category_page/comment/$index.png'))),
                  ),
                  SizedBox(width: 11),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(userComment[index],
                          style: TextStyle(color: Colors.black, fontSize: 12)),
                      SizedBox(height: 10),
                      Container(
                        width: 276,
                        child: Text(
                          comment,
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        ),
                      ),
                      SizedBox(height: 8),
                      RatingBar.builder(
                          ignoreGestures: true,
                          allowHalfRating: true,
                          initialRating: 4.5,
                          itemSize: 12,
                          itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: AppColors.mainRed,
                              ),
                          onRatingUpdate: (rating) {
                            setState(() {});
                          }),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text('10:56',
                              style: TextStyle(
                                  color: Color(0xFF8d8d8d), fontSize: 10)),
                          SizedBox(width: 19),
                          Text('19.10.20',
                              style: TextStyle(
                                  color: Color(0xFF8d8d8d), fontSize: 10))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text('Больше отзывов',
                style: TextStyle(color: AppColors.blue1, fontSize: 12),
                textAlign: TextAlign.end),
          ),
          SizedBox(height: 26),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              thickness: 1.1,
              color: Color(0xFFdbdbdb),
            ),
          ),
          SizedBox(height: 20),
          Text('Поставить рейтинг и оставить отзыв',style: TextStyle(color: Color(0xFF515151),fontSize: 14),textAlign: TextAlign.center),
          SizedBox(height: 17),
          Center(
            child: RatingBar.builder(
                initialRating: 1,
                itemSize: 19,
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Color(0xFFFF6B00),
                ),
                onRatingUpdate: (rating) {
                  setState(() {});
                }),
          ),
          SizedBox(height: 34),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 78,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 0.5,color: Color(0xff929292).withOpacity(0.37)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x1A000000),
                    blurRadius: 4,
                    offset: Offset(0,4)
                  )
                ]
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Отзыв',
                  hintStyle: TextStyle(color: Color(0xFFAFAFAF),fontSize: 14)
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 110.0),
            child: Container(
              width: 140,
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFFF6B00),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(child: Text('Отправить',style: TextStyle(color: Colors.white,fontSize: 14),)),
            ),
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget infoWidget(String icon, String text) {
    return Expanded(
      child: Container(
        width: 145,
        child: Row(
          children: [
            Image.asset(
              'assets/img/category_page/infoIcons/${icon}Icon.png',
              width: 19,
              height: 19,
            ),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF313131),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
