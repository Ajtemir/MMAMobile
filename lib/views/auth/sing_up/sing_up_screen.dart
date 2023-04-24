import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upai_app/service/base_client.dart';
import 'package:upai_app/views/auth/server/service.dart';
import 'package:upai_app/views/auth/sing_in/sing_in_screen.dart';
import 'package:http/http.dart' as http;
import '../../../shared/app_colors.dart';
import '../email_verify/email_verify.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({Key? key}) : super(key: key);

  @override
  _SingUpScreenState createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {


  void cancelToast(String msgError) => Fluttertoast.showToast(
      msg: msgError,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  bool showPassword = false;

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
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(
                    color: AppColors.blue1,
                    fontSize: 16,
                  ),
                  decoration: InputDecoration(
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.5),
                    ),
                    hintText: 'Email',
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                          left: 11, top: 16, right: 13, bottom: 17),
                      child: Icon(
                        Icons.email_outlined,
                        color: Color(0xFF225196),
                        size: 19,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 250,
                      child: TextField(
                        controller: password,
                        obscureText: showPassword,
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
                                left: 11, top: 16, right: 13, bottom: 17),
                            child: Image.asset('assets/img/iconPassword.png'),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showPassword = !showPassword;
                        setState(() {});
                      },
                      icon: showPassword
                          ? Icon(
                              Icons.remove_red_eye_outlined,
                              color: Color(0xFF225196),
                            )
                          : Icon(
                              Icons.remove_red_eye_rounded,
                              color: Color(0xFF225196),
                            ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 300,
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppColors.blue1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: password2,
                  obscureText: showPassword,
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
                          left: 11, top: 16, right: 13, bottom: 17),
                      child: Image.asset('assets/img/iconPassword.png'),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (password.text != password2.text) {
                    cancelToast("Пароли не совпадают!");
                  } else {
                    bool ans = await AuthClient()
                        .postSingUp(email.text, password.text, 'User/SignUp');
                    if (ans) {
                      await AuthClient().getConfirmEmail(email.text);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => EmailVerify(email: email.text)));

                    } else {
                      cancelToast("Введите правильно email или пароль");
                    }
                  }
                },
                child: Ink(
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
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => SingInScreen()));
                  },
                  child: Text(
                    'Войти',
                    style: TextStyle(color: AppColors.blue1, fontSize: 16),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
