import 'package:flutter/material.dart';
import 'package:upai_app/views/pages/profile/profileEditing.dart';

import '../shared/app_colors.dart';

class CircleAvatar extends StatefulWidget {
  final bool isLoading;
  // ignore: use_key_in_widget_constructors
  const CircleAvatar({required this.isLoading});

  @override
  _CircleAvatarState createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<CircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Stack(
          //overflow: Overflow.visible,
          children: [
            Container(
              padding: EdgeInsets.all(8),
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
                    image: AssetImage('assets/img/user2.png')),
              ),
            ),
            widget.isLoading ?
            Positioned(
              top: 0,
              right: 72,
              child: GestureDetector(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>UserEditing()));},
                child: Container(
                  padding: EdgeInsets.all(9),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:AppColors.red1,
                  ),
                  child: Image.asset(
                    'assets/img/penIcon.png',
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
            ):
                Center(),

          ],
        ),
      ),
    );
  }
}
