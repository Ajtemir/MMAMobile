import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../fetches/category_products_fetch.dart';
import '../../model/productModel.dart';
import '../../provider/selectCatProvider.dart';
import '../../service/service.dart';
import '../category/aboutMagaz.dart';

class CategoryProducts extends StatefulWidget {
  final categoryName;
  final categoryId;
  const CategoryProducts(
      {Key? key, required this.categoryId, required this.categoryName})
      : super(key: key);

  @override
  _CategoryProductsState createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  late Future<ListProductsModel> futureCategoryProducts;
  late String emailGet;

  @override
  void initState() {
    emailGet = Provider.of<SelectCatProvider>(context, listen: false).email;
    // TODO: implement initState
    super.initState();
    futureCategoryProducts = fetchCategoryProducts(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AllAppBar2(),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              children: [
                SizedBox(height: 10),
                ListTile(
                  leading: Text(widget.categoryName,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400)),
                  /*trailing: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Удалить',
                      style: TextStyle(color: AppColors.red1, fontSize: 15),
                    ),
                  )*/
                ),
                FutureBuilder<ListProductsModel>(
                  future: fetchCategoryProducts(widget.categoryId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var items = snapshot.data!.data!.length;
                      return Center(
                        child: Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            // scrollDirection: Axis.horizontal,
                            children: [
                              /*HotKesh(0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
                          SizedBox(width: 10),
                          HotKesh(1, 3, 27, 'Enter kg', 'Электро техника', 16),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/1025f602-1814-422a-9b05-be25b5377389.png', 5, 193, 'Сатылат', 'Fast food', 25),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/9492e584-e0bc-4d98-a06b-b55d60afd380.jpg', 3, 27, 'Телефон', 'Электро техника', 16),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/3949ff22-45a3-4251-95d4-1dc2d43f289e.jpg', 2, 42, 'Продается', 'Электро техника', 16),*/
                              for (var i = 0; i < items; i++)
                                HotKeshSecond(
                                    snapshot.data!.data![i].images!.length > 0
                                        ? snapshot.data!.data![i].images![0]
                                        : null,
                                    3,
                                    snapshot.data!.data![i].description!,
                                    snapshot.data!.data![i].price.toString(),
                                    ((snapshot.data!.data![i].id!).toString()),
                                    emailGet),
                            ]

                            /*HotKesh(2, 4, 193, 'Baby Store', 'Для детей', 14),
                          SizedBox(width: 10),
                          HotKesh(3, 5, 27, 'Cinematika', 'Кино и театр', 24)*/

                            ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    // By default, show a loading spinner.
                    return Center(child: const CircularProgressIndicator());
                  },
                ),
              ]),
        )
        //       Expanded(
        //         child: Padding(
        //           padding: const EdgeInsets.only(left: 14.0),
        //           child: Container(
        //             height: 150,
        //             child: Wrap(
        //               // scrollDirection: Axis.horizontal,
        //               children: leftRight
        //                   ? [
        //                       HotKesh(
        //                           0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
        //                       SizedBox(width: 10),
        //                       HotKesh(
        //                           1, 3, 27, 'Enter kg', 'Электро техника', 16),
        //                       SizedBox(width: 10),
        //                       HotKesh(
        //                           0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
        //                       SizedBox(width: 10),
        //                       HotKesh(1, 3, 27, 'Enter kg', 'Электро техника', 16)
        //                     ]
        //                   : [
        //                       HotKesh(2, 4, 193, 'Baby Store', 'Для детей', 14),
        //                       SizedBox(width: 10),
        //                       HotKesh(3, 5, 27, 'Cinematika', 'Кино и театр', 24)
        //                     ],
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

  Widget HotKeshSecond(String? image, double rat, String name, String cat,
      String productId, String email) {
    List<String> nameAndDescription = [
      name.split('name').first,
      name.split('name').last
    ];
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutMagaz(
                productId: productId,
                email: email,
                checkUserPage: false,
              ))),
      child: Ink(
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
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
                  image: image != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('http://${AuthClient.ip}/$image'))
                      : DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/hotKesh/kesh0.jpg'))),
            ),
            SizedBox(height: 12),
            /*Row(
                      children: [
                        RatingBar.builder(
                            initialRating: rat,
                            itemSize: 12,
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
                          TextStyle(color: AppColors.mainRed, fontSize: 12),
                        ),
                      ],
                    ),*/
            SizedBox(height: 5),
            Container(
              child: Text(
                nameAndDescription[0],
                style: TextStyle(color: Color(0xFF313131), fontSize: 16),
                overflow: TextOverflow.clip,
              ),
            ),
            SizedBox(height: 5),
            Text(
              cat == 'null' ? "Договорная" : cat.split('.').first + ' сом',
              style: TextStyle(color: Colors.orange, fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}

// Widget HotKesh(
//     int image, double rat, int otzyv, String name, String cat, int kesh) {
//   return GestureDetector(
//     onTap: () => Navigator.of(context)
//         .push(MaterialPageRoute(builder: (context) => HotKeshPage())),
//     child: Container(
//       width: 190,
//       child: Column(
//         children: [
//           Container(
//             width: 200,
//             height: 120,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(
//                     width: 2.5, color: Color(0xFF929292).withOpacity(0.37)),
//                 boxShadow: [
//                   BoxShadow(
//                       blurRadius: 7,
//                       offset: Offset(0, 6),
//                       color: Color(0x33000000))
//                 ],
//                 image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/img/hotKesh/kesh$image.jpg'))),
//           ),
//           SizedBox(height: 12),
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       RatingBar.builder(
//                           initialRating: rat,
//                           itemSize: 12,
//                           itemBuilder: (context, _) => Icon(
//                                 Icons.star,
//                                 color: AppColors.mainRed,
//                               ),
//                           onRatingUpdate: (rating) {
//                             // setState
//                             (() {
//                               rat = rating;
//                             });
//                           }),
//                       SizedBox(width: 2.5),
//                       Text(
//                         '$rat',
//                         style:
//                             TextStyle(color: AppColors.mainRed, fontSize: 12),
//                       ),
//                       SizedBox(width: 2),
//                       Text(
//                         '($otzyv отзыва)',
//                         style:
//                             TextStyle(color: Color(0xFF313131), fontSize: 10),
//                       )
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     name,
//                     style: TextStyle(color: Color(0xFF313131), fontSize: 12),
//                   ),
//                   SizedBox(height: 5),
//                   Text(
//                     cat,
//                     style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 10),
//                   )
//                 ],
//               ),
//               SizedBox(width: 22),
//               Container(
//                 width: 25,
//                 child: Text(
//                   'до $kesh%',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: AppColors.green, fontSize: 10),
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }
