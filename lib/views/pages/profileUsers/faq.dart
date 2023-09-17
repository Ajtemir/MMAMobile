import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../shared/app_colors.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<bool> tap = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    String text =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip''';
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        children: [
          Text('FAQ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w400)),
          SizedBox(height: 23),
          Container(
            height: MediaQuery.of(context).size.height * 0.75,
            child: ListView.separated(
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(height: 18),
              itemBuilder: (BuildContext context, int index) {
                return AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: tap[index] ? 200 : 80,
                  curve: Curves.fastOutSlowIn,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1, color: AppColors.blue1)),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Как работает программа?',
                                style: TextStyle(
                                    color: AppColors.blue1, fontSize: 16)),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  tap[index] = !tap[index];
                                });
                              },
                              child: Image.asset('assets/img/prof/faq.png',
                                  width: 20, height: 20),
                            )
                          ],
                        ),
                        SizedBox(height: 7),
                        Text(text,
                            style: TextStyle(
                                color: Color(0xFF515151), fontSize: 14)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
