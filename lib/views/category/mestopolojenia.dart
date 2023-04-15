import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:upai_app/shared/app_colors.dart';

class Mestapolojenia extends StatefulWidget {
  const Mestapolojenia({Key? key}) : super(key: key);

  @override
  State<Mestapolojenia> createState() => _MestapolojeniaState();
}

class _MestapolojeniaState extends State<Mestapolojenia> {
  bool leftRight = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: TextFormField(
          decoration: InputDecoration(
              hintText: "Поиск",
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                color: Color(0xFFEBEBEB),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          leftRight = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: leftRight ? AppColors.red1 : null),
                        child: Center(
                          child: Text(
                            'Города',
                            style: TextStyle(
                                color: leftRight ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          leftRight = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: leftRight ? null : AppColors.red1),
                        child: Center(
                          child: Text(
                            'Карта',
                            style: TextStyle(
                                color: leftRight ? Colors.black : Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(child: ListView(children: [],)),
        ],
      ),
    );
  }
}
