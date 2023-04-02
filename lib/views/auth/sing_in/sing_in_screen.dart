

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:upai_app/views/auth/sing_up/sing_up_screen.dart';
import 'package:upai_app/views/home/home_screen.dart';

import '../../../shared/app_text_styles.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {


  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late bool passwordObscured;


  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    passwordObscured = true;
    super.initState();
  }


  phoneField() {
    return  Container(
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xFF225196),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        keyboardType: TextInputType.phone,
        style: TextStyle(
          color: Color(0xFF225196),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Color(0xFF225196).withOpacity(0.5),
          ),
          hintText: 'Номер',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
                left: 18, top: 11, right: 13, bottom: 12),
            child: Image.asset('assets/img/iconPhone.png'),
          ),
        ),
      ),
    );
  }

  passwordField() {
    return Container(
      width: 300,
      height: 45,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Color(0xFF225196),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: true,
        obscuringCharacter: '*',
        style: TextStyle(
          color: Color(0xFF225196),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: Color(0xFF225196).withOpacity(0.5),
          ),
          hintText: 'Пароль',
          border: InputBorder.none,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(
                left: 18, top: 11, right: 13, bottom: 12),
            child: Image.asset('assets/img/iconPassword.png'),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 85,
              ),
              Image.asset(
                'assets/img/logo.png',
                width: 148,
                height: 148,
              ),
              SizedBox(
                height: 34,
              ),
              Text(
                'Войти через социальные сети',
                style: TextStyle(
                  fontSize: 18,
                  color: Color(0xFF515151),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF225196),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Image.asset('assets/img/google.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF225196),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Image.asset('assets/img/facebook.png'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              phoneField(),

              SizedBox(
                height: 15,
              ),
              passwordField(),
              SizedBox(
                height: 20,
              ),











              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (_) => Home()));
                },
                child: Container(
                  width: 163,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Color(0xFF225196),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                        'Войти',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(height: 80.h),













              SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {},
                  child: Text(
                    'Не можете войти?',
                    style: TextStyle(color: Color(0xFF225196), fontSize: 12),
                  )),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) => SingUpScreen()));
                  },
                  child: Text(
                    'Зарегистрироваться',
                    style: TextStyle(color: Color(0xFF225196), fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}