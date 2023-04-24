import 'package:flutter/material.dart';

import '../shared/app_colors.dart';

class AllAppBar2 extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: AppColors.blue1, //change your color here
      ),
      elevation: 0,
      backgroundColor: Colors.white,

    );
  }
}
