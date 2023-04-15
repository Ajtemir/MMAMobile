import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:upai_app/views/pages/hotKesh.dart';
import 'package:upai_app/widgets/appBar.dart';

import '../../shared/app_colors.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:upai_app/views/pages/Filtr.dart';
import 'package:upai_app/views/pages/hotKesh.dart';
import 'package:upai_app/widgets/UserAvatar.dart';
import 'package:upai_app/widgets/appBar.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  bool leftRight = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AllAppBar(),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(height: 10),
            ListTile(
                leading: Text('Избранное',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400)),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Удалить',
                    style: TextStyle(color: AppColors.red1, fontSize: 15),
                  ),
                )),
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
