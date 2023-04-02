import 'package:flutter/material.dart';
import 'package:upai_app/widgets/UserAvatar.dart';
import 'package:upai_app/widgets/appBar.dart';

import '../../shared/app_colors.dart';

class QR_Page extends StatefulWidget {
  const QR_Page({Key? key}) : super(key: key);

  @override
  _QR_PageState createState() => _QR_PageState();
}

class _QR_PageState extends State<QR_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              trailing: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.red1,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      '1520 сом',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ),
              title: Text(
                'User name',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              leading: UserAvatar(),
            ),
            SizedBox(height: 40),
            Container(
              width: double.infinity,
              height: 376,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 11,
                    offset: Offset(0,4)
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Сканировать QR',style: TextStyle(color: Colors.black,fontSize: 20),),
                  SizedBox(height: 51),
                  Container(
                    width: 123,
                    height: 123,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/img/qr.png'),
                      )
                    ),
                  ),
                  SizedBox(height: 37),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text('Предъявите QR код сотрудницу магаизна на кассе для начисления бонусных баллов',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF515151),fontSize: 16),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
