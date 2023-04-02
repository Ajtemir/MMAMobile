import 'package:flutter/material.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../shared/app_colors.dart';

class Zayavka extends StatefulWidget {
  const Zayavka({Key? key}) : super(key: key);

  @override
  _ZayavkaState createState() => _ZayavkaState();
}

class _ZayavkaState extends State<Zayavka> {
  String text='Заявка перехода на бизнес профиль успешно отправлена. Ожидайте звонка, в течении 24 часов мы свяжемся с вами';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
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
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                        image: AssetImage('assets/img/category_page/comment/0.png')),
                  ),
                ),
              ),
            ),
            SizedBox(height: 18),
            Image.asset('assets/img/prof/bussines/checkIcon.png',width: 103,height: 103),
            Text(text,textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
            SizedBox(height: 57),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 86.0),
              child: GestureDetector(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1,color: AppColors.red1)
                  ),
                  child: Center(
                    child: Text('На главную',style: TextStyle(color: AppColors.blue1,fontSize: 14)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
