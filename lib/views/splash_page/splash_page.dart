import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:upai_app/views/auth/sing_in/sing_in_screen.dart';
import 'package:upai_app/views/home/home_screen.dart';

import '../../provider/selectCatProvider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      SharedPreferences.getInstance().then((prefs) {
        var email = prefs.getString('email');
        if(email != null){
          Provider.of<SelectCatProvider>(context, listen: false)
              .setEmail(email);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SingInScreen()));
        }
        else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (_) => SingInScreen()));
        }
      });

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/img/logo.png',height: 228,width: 228,),
      ),
    );
  }
}
