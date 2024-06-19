import 'package:flutter/material.dart';

import '../drawer/profileDrawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child:
          ProfileDrawer() /*SingleChildScrollView(
        child: Column(
          children: [
            const About(),
            Container(
              color: bgColor,
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    */ /*PersonalInfo(),
                    MySKills(),
                    Knowledges(),*/ /*
                    Divider(),
                    SizedBox(
                      height: defaultPadding,
                    ),
                    */ /*ContactIcon(),*/ /*
                  ],
                ),
              ),
            )
          ],
        ),
      )*/
      ,
    );
  }
}
