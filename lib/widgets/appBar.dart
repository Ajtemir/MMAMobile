import 'package:flutter/material.dart';

class AllAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AllAppBar({Key? key, this.leading}) : super(key: key);
  final Widget? leading;
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      title: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/img/logo.png'))),
      ),
      // elevation: 0,
      backgroundColor: Colors.white,
      // leading: TextButton(
      //     onPressed: () {
      //       Navigator.of(context)
      //           .push(MaterialPageRoute(builder: (context) => DrawerScreen()));
      //     },
      //     child: Text("Фильтр")),
      // actions: [
      //   IconButton(
      //     onPressed: () {},
      //     icon: Icon(
      //       Icons.search,
      //       color: AppColors.blue1,
      //     ),
      //   ),
      // ],
    );
  }
}
