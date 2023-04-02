import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/provider/selectCatProvider.dart';
import 'package:upai_app/shared/app_colors.dart';
import 'package:upai_app/views/category/filter.dart';
import 'package:upai_app/widgets/appBar.dart';

class CategoryFilter extends StatefulWidget {
  const CategoryFilter({Key? key}) : super(key: key);

  @override
  _CategoryFilterState createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 14, top: 5),
        children: [
          ListTile(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Filter(category: '',))),
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
          Text(
            Provider.of<SelectCatProvider>(context).category,
            style: TextStyle(color: Color(0xFF313131), fontSize: 16),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 20,
              spacing: 10,
              children: [
                SlideContainer(0, 5, 193, 'Ресторан Дияр', 25),
                SlideContainer(1, 4, 148, 'Ресторан Кайн',  16),
                SlideContainer(2, 4, 95, 'Ресторан Кайнар',  16),
                SlideContainer(3, 4.3, 371, 'Cinematica',  25),
                SlideContainer(4, 4, 93, 'Brodway cinema',  16),
                SlideContainer(5, 5, 109, 'Manas cinema',  16),
                SlideContainer(6, 5, 193, 'LC waikiki',  25),
                SlideContainer(7, 4.8, 148, 'Hugo BOSS',  16),
                SlideContainer(8, 5, 180, 'Lion',  16),
                SlideContainer(9, 4.6, 371, 'Иллюзион',  25),
                SlideContainer(10, 3.9, 93, 'Brodway cinema',  16),
                SlideContainer(11, 5, 293, 'Manas cinema',  16)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SlideContainer(
      int image, double rat, int otzyv, String name,int kesh) {
    return Container(
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
                      image: AssetImage('assets/img/category_page/$image.jpg'))),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/category_page/procentContIcon.png')
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('15%',style: TextStyle(
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
                child: Image.asset('assets/img/category_page/procentIcon.png',width: 10,height: 10),
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
                      image: AssetImage('assets/img/category_page/$image.jpg'))),
            ),
            Positioned(
              right: 5,
              top: 5,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/category_page/procentContIcon.png')
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('15%',style: TextStyle(
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
                child: Image.asset('assets/img/category_page/procentIcon.png',width: 10,height: 10),
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
