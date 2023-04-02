import 'package:flutter/material.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../shared/app_colors.dart';

class ToCard extends StatefulWidget {
  const ToCard({Key? key}) : super(key: key);

  @override
  _ToCardState createState() => _ToCardState();
}

class _ToCardState extends State<ToCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Вывод денег',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 28),
            Container(
              padding: EdgeInsets.symmetric(vertical: 50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF26000000),
                      blurRadius: 11,
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/prof/purse/toCard.png',
                      width: 100, height: 100),
                  SizedBox(height: 48),
                  Container(
                    width: 210,
                      child: Text(
                    '2500 сом были успешно переведены на Элсом',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF515151), fontSize: 16),
                  )),
                  SizedBox(height: 34),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 56.0),
                    child: GestureDetector(
                      onTap: ()=>Navigator.pop(context),
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                            color: AppColors.red1,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text('Закрыть',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
