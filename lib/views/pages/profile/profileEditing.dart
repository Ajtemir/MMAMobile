import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../shared/app_colors.dart';

class UserEditing extends StatefulWidget {
  const UserEditing({Key? key}) : super(key: key);

  @override
  _UserEditingState createState() => _UserEditingState();
}

class _UserEditingState extends State<UserEditing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.blue1, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,color: AppColors.blue1,),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.only(left: 14, right: 14, top: 5),
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
                          image: AssetImage('assets/img/user.png')),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 72,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.red1,
                        ),
                        child: Image.asset(
                          'assets/img/prof/editingIcon.png',
                          width: 15,
                          height: 15,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 65,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color:AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'User name',
                hintStyle: TextStyle(
                  color: Color(0xFFA6A6A6),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone number',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'email',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 112.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFF6B00)
                ),
                child: Center(child: Text('Сохранить',style: TextStyle(color: Colors.white,fontSize: 14))),
              ),
            ),
          ),
          SizedBox(height: 42),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Старый пароль',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Новый пароль',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Повторите новый пароль',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 86.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.red1
                ),
                child: Center(child: Text('Изменить пароль',style: TextStyle(color: Colors.white,fontSize: 14))),
              ),
            ),
          ),
          SizedBox(height: 108),
        ],
      ),
    );
  }
}
