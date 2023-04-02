import 'package:flutter/material.dart';
import 'package:upai_app/views/drawer/drawer_screen.dart';

import '../shared/app_colors.dart';

class AllAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: AppColors.blue1,
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>DrawerScreen()));
        },
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search,color: AppColors.blue1,),
        ),
      ],
    );
  }
}
