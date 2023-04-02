import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(width: 0.5,color: Color(0xFF929292)),
          image: DecorationImage(
              image: AssetImage('assets/img/user.png')
          )
      ),
    );
  }
}
