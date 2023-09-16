import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:upai_app/shared/app_colors.dart';
import 'package:upai_app/widgets/appBar.dart';

class Messej extends StatelessWidget {
  const Messej({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            ListTile(
                leading: Text(
                  'Чаты',
                  style: TextStyle(color: Color(0xFF313131), fontSize: 19),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Уведомления',
                    style: TextStyle(color: AppColors.red1, fontSize: 15),
                  ),
                )),
            Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      child: Image.asset("assets/img/user.png"),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Name Tovar"),
                        Row(
                          children: [
                            Text("messej"),
                            SizedBox(
                              width: 90,
                            ),
                            Text("04.01.23")
                          ],
                        )
                      ],
                    ),
                    Image.asset(
                      "assets/img/kesh.png",
                      width: 55,
                      height: 55,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
