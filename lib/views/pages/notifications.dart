import 'package:flutter/material.dart';
import 'package:upai_app/widgets/appBar.dart';

import '../../shared/app_colors.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool leftRight = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Text('Уведомления',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400)),
            SizedBox(height: 17),
            Container(
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
                            'Поступления',
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
                            'Вывод',
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
            SizedBox(height: 22),
            Expanded(
              child: ListView(
                children: !leftRight
                    ? [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child:
                                  Image.asset('assets/img/notif/moneyIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'На карту было выведено 1520 сом',
                                  style: TextStyle(
                                      color: Color(0xFF313131),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      '14.10.2020',
                                      style: TextStyle(
                                          color: Color(0xFF6B6B6B),
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    SizedBox(width: 19),
                                    Text('21:44',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                      ]
                    : [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child: Image.asset(
                                  'assets/img/notif/redDollarIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 230,
                                    child: Text(
                                      'Кешбек в размере 123 сом был отклонен',
                                      style: TextStyle(
                                          color: Color(0xFF313131),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('LC waikiki',
                                        style: TextStyle(
                                            color: Color(0xFF313131),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(width: 70),
                                    Text('13:11',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(width: 19),
                                    Text('14.10.2020',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            height: 1,
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child: Image.asset(
                                  'assets/img/notif/yellowDollarIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 230,
                                    child: Text(
                                      'Кешбек в размере 123 сом в ожидании',
                                      style: TextStyle(
                                          color: Color(0xFF313131),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('LC waikiki',
                                        style: TextStyle(
                                            color: Color(0xFF313131),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(width: 70),
                                    Text('13:11',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(width: 19),
                                    Text('14.10.2020',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Divider(
                            height: 1,
                            color: Color(0xFFEBEBEB),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 0.5,
                                      color:
                                          Color(0xFF929292).withOpacity(0.37)),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 4,
                                      color: Color(0x1A000000),
                                      offset: Offset(0, 4),
                                    )
                                  ]),
                              child: Image.asset(
                                  'assets/img/notif/greenDollarIcon.png'),
                            ),
                            SizedBox(width: 19),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    width: 230,
                                    child: Text(
                                      'Кешбек  в размере 123 сом поступило',
                                      style: TextStyle(
                                          color: Color(0xFF313131),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    )),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text('LC waikiki',
                                        style: TextStyle(
                                            color: Color(0xFF313131),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(width: 70),
                                    Text('13:11',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                    SizedBox(width: 19),
                                    Text('14.10.2020',
                                        style: TextStyle(
                                            color: Color(0xFF6B6B6B),
                                            fontSize: 10,
                                            fontWeight: FontWeight.w300)),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            height: 1,
            color: Color(0xFFEBEBEB),
          ),
        ),
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 0.5,
                      color:
                      Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x1A000000),
                      offset: Offset(0, 4),
                    )
                  ]),
              child: Image.asset(
                  'assets/img/notif/greenDollarIcon.png'),
            ),
            SizedBox(width: 19),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: 230,
                    child: Text(
                      'Кешбек  в размере 123 сом поступило',
                      style: TextStyle(
                          color: Color(0xFF313131),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('LC waikiki',
                        style: TextStyle(
                            color: Color(0xFF313131),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 70),
                    Text('13:11',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                    SizedBox(width: 19),
                    Text('14.10.2020',
                        style: TextStyle(
                            color: Color(0xFF6B6B6B),
                            fontSize: 10,
                            fontWeight: FontWeight.w300)),
                  ],
                )
              ],
            )
          ],
        ),
                      ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
