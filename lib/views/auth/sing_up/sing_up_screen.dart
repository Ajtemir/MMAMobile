import 'package:flutter/material.dart';
import 'package:upai_app/views/auth/sing_in/sing_in_screen.dart';

import '../../../shared/app_colors.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
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
                          color: AppColors.blue1,
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
                          color: AppColors.blue1,
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
              Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.5),
                    ),
                    hintText: 'Введите номер',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 11, right: 13, bottom: 12),
                      child: Image.asset('assets/img/iconPhone.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.5),
                    ),
                    hintText: 'Введите пароль',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 11, right: 13, bottom: 12),
                      child: Image.asset('assets/img/iconPassword.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  obscureText: true,
                  obscuringCharacter: '*',
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.5),
                    ),
                    hintText: 'Повторите пароль',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 18, top: 11, right: 13, bottom: 12),
                      child: Image.asset('assets/img/iconPassword.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 245,
                  height: 45,
                  decoration: BoxDecoration(
                      color: AppColors.blue1,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text(
                        'Зарегистрироваться',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      )),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (_) => SingInScreen()));
                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(color: AppColors.blue1, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    )
;
  }
}
