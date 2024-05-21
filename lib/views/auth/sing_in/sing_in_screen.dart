import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upai_app/constants/constants.dart';
import 'package:upai_app/views/auth/sing_up/sing_up_screen.dart';
import 'package:upai_app/views/home/home_screen.dart';

import '../../../provider/selectCatProvider.dart';
import '../../../provider/selectTabProvider.dart';
import '../../../shared/app_text_styles.dart';
import '../server/service.dart';

class SingInScreen extends StatefulWidget {
  const SingInScreen({Key? key}) : super(key: key);

  @override
  _SingInScreenState createState() => _SingInScreenState();
}

class _SingInScreenState extends State<SingInScreen> {
  TextEditingController email =
      TextEditingController(text: "first@example.com");
  TextEditingController password = TextEditingController(text: "password");
  TextEditingController ip = TextEditingController(text: "192.168.21.236");
  TextEditingController port = TextEditingController(text: "8080");
  TextEditingController scheme = TextEditingController(text: "http");
  bool showPassword = false;
  bool circular = false;

  phoneField() {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFF225196),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: email,
        keyboardType: TextInputType.emailAddress,
        style: const TextStyle(
          color: Color(0xFF225196),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: const Color(0xFF225196).withOpacity(0.5),
          ),
          hintText: 'Email',
          border: InputBorder.none,
          prefixIcon: const Padding(
              padding: EdgeInsets.only(
                  left: 18, top: 11, right: 13, bottom: 12),
              child: Icon(
                Icons.email_outlined,
                color: Color(0xFF225196),
                size: 19,
              )),
        ),
      ),
    );
  }

  ipField() {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFF225196),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: ip,
        style: const TextStyle(
          color: Color(0xFF225196),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: const Color(0xFF225196).withOpacity(0.5),
          ),
          hintText: 'IP adress',
          border: InputBorder.none,
          prefixIcon: const Padding(
              padding: EdgeInsets.only(
                  left: 18, top: 11, right: 13, bottom: 12),
              child: Icon(
                Icons.settings,
                color: Color(0xFF225196),
                size: 19,
              )),
        ),
      ),
    );
  }

  portField() {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFF225196),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: port,
        style: const TextStyle(
          color: Color(0xFF225196),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: const Color(0xFF225196).withOpacity(0.5),
          ),
          hintText: 'Port number',
          border: InputBorder.none,
          prefixIcon: const Padding(
              padding: EdgeInsets.only(
                  left: 18, top: 11, right: 13, bottom: 12),
              child: Icon(
                Icons.settings,
                color: Color(0xFF225196),
                size: 19,
              )),
        ),
      ),
    );
  }

  schemeField() {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFF225196),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: scheme,
        style: const TextStyle(
          color: Color(0xFF225196),
          fontSize: 16,
        ),
        decoration: InputDecoration(
          hintStyle: TextStyle(
            color: const Color(0xFF225196).withOpacity(0.5),
          ),
          hintText: 'Port number',
          border: InputBorder.none,
          prefixIcon: const Padding(
              padding: EdgeInsets.only(
                  left: 18, top: 11, right: 13, bottom: 12),
              child: Icon(
                Icons.settings,
                color: Color(0xFF225196),
                size: 19,
              )),
        ),
      ),
    );
  }

  void showToast(String msgError) => Fluttertoast.showToast(
      msg: msgError,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.green,
      textColor: Colors.white);

  void cancelToast(String msgError) => Fluttertoast.showToast(
      msg: msgError,
      fontSize: 18,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white);

  passwordField() {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: const Color(0xFF225196),
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
              style: const TextStyle(
                color: Color(0xFF225196),
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: const Color(0xFF225196).withOpacity(0.5),
                ),
                hintText: 'Пароль',
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, top: 16, right: 13, bottom: 17),
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
                ? const Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xFF225196),
                  )
                : const Icon(
                    Icons.remove_red_eye_rounded,
                    color: Color(0xFF225196),
                  ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 85,
              ),
              Image.asset(
                'assets/img/logo.png',
                width: 148,
                height: 148,
              ),
              const SizedBox(
                height: 34,
              ),
              /*Text(
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
              ),*/
              const SizedBox(
                height: 23,
              ),
              phoneField(),
              const SizedBox(
                height: 15,
              ),
              passwordField(),
              const SizedBox(
                height: 20,
              ),
              ipField(),
              const SizedBox(
                height: 20,
              ),
              portField(),
              const SizedBox(
                height: 20,
              ),
              schemeField(),
              InkWell(
                onTap: () async {
                  AuthClient.ip = ip.text;
                  Constants.host = ip.text;
                  Constants.port = int.parse(port.text);
                  Constants.scheme = scheme.text;
                  circular = true;
                  setState(() {});
                  String ans =
                      await AuthClient().postSingIn(email.text, password.text);
                  if (ans == 'true') {
                    circular = false;
                    setState(() {});
                    showToast('Вход выполнен!');
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setString('email', email.text);
                    Provider.of<SelectCatProvider>(context, listen: false)
                        .setEmail(email.text);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const Home()));
                  } else if (ans == 'password') {
                    circular = false;
                    setState(() {});
                    cancelToast('Неправильный пароль!');
                  } else {
                    circular = false;
                    setState(() {});
                    cancelToast('Email не зарегистрирован!');
                  }
                },
                child: Ink(
                  width: 163,
                  height: 45,
                  decoration: BoxDecoration(
                      color: const Color(0xFF225196),
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: circular
                          ? const CircularProgressIndicator()
                          : const Text(
                              'Войти',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(height: 80.h),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Не можете войти?',
                    style: TextStyle(color: Color(0xFF225196), fontSize: 12),
                  )),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const SingUpScreen()));
                  },
                  child: const Text(
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
