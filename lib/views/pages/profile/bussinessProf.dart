import 'package:flutter/material.dart';
import 'package:upai_app/views/pages/profile/zayavka.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../shared/app_colors.dart';

class BussinesProf extends StatefulWidget {
  const BussinesProf({Key? key}) : super(key: key);

  @override
  _BussinesProfState createState() => _BussinesProfState();
}

class _BussinesProfState extends State<BussinesProf> {

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
            SizedBox(height: 36),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Бизнес профиль',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.w400)),
                GestureDetector(
                  child: Image.asset('assets/img/prof/bussines/questionIcon.png',width: 20,height: 20),
                ),
              ],
            ),
            SizedBox(height: 23),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',style: TextStyle(color: Color(0xFF515151),fontSize: 14),),
            SizedBox(height: 19),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: AppColors.blue1,),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color:AppColors.blue1.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Название бизнес профиля'
                  ),
                )
            ),
            SizedBox(height: 10),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color:AppColors.blue1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: AppColors.blue1.withOpacity(0.4),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Телефон'
                  ),
                )
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36.0),
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Zayavka())),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                      color: AppColors.red1,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Оставить заявку на звонок',style: TextStyle(color: Colors.white,fontSize: 14),),
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
