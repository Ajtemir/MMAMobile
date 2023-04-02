import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:upai_app/widgets/appBar2.dart';
import '../../shared/app_colors.dart';
import 'utils.dart';

class HotKeshPage extends StatefulWidget {
  const HotKeshPage({Key? key}) : super(key: key);

  @override
  _HotKeshPageState createState() => _HotKeshPageState();
}

class _HotKeshPageState extends State<HotKeshPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String text =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.';
  List<String> userComment = [
    'Азим Дженалиев',
    'Елена Ворон',
    'Дмитрий Воробьев'
  ];
  String comment =
  '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua tempor incididunt ut labore et dolore ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView(
        children: [
          Stack(children: [
            Container(
              height: 199,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/hotKesh/hotKeshPage.png'))),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/hotKesh/contIcon.png')),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text('25%',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.mainRed,
                        fontSize: 12,
                      )),
                ),
              ),
            ),
            Positioned(
              right: 52,
              bottom: 24,
              child: Container(
                padding: EdgeInsets.all(3),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: AppColors.mainRed,
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/img/hotKesh/fireIcon.png',
                    width: 10, height: 10),
              ),
            )
          ]),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Большие скидки на 8 марта',
                    style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 30),
                Text('О горящем кэшбэке',
                    style: TextStyle(
                        color: Color(0xFF505050),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 13),
                Text(
                  text,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 50),
                Text('Даты горящего кэшбэка',
                    style: TextStyle(
                        color: Color(0xFF515151),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          SizedBox(height: 14),
          TableCalendar(
            // today's date
            focusedDay: _focusedDay,
            // earliest possible date
            firstDay: kFirstDay,
            // latest allowed date
            lastDay: kLastDay,
            // default view when displayed
            calendarFormat: CalendarFormat.month,
            // default is Saturday & Sunday but can be set to any day.
            // instead of day, a number can be mentioned as well.
            weekendDays: const [DateTime.sunday, 6],
            // default is Sunday but can be changed according to locale
            startingDayOfWeek: StartingDayOfWeek.monday,
            // height between the day row and 1st date row, default is 16.0
            daysOfWeekHeight: 40.0,
            // height between the date rows, default is 52.0
            rowHeight: 60.0,
            selectedDayPredicate: (day) {
              // Use `selectedDayPredicate` to determine which day is currently selected.
              // If this returns true, then `day` will be marked as selected.

              // Using `isSameDay` is recommended to disregard
              // the time-part of compared DateTime objects.
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Горящий кэшбэк действует',
                    style: TextStyle(
                        color: Color(0xFF515151),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                SizedBox(height: 11),
                Row(
                  children: [
                    Image.asset('assets/img/hotKesh/watch.png',width: 17,height: 17),
                    SizedBox(width: 14),
                    Text('C 18:00 - 23:00 ',style:
                    TextStyle(
                        color: Color(0xFF515151),
                        fontSize: 14,
                        fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(height: 58),
                Text('Узнать подробнее',style: TextStyle(
                    color: Color(0xFF515151),
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
                SizedBox(height: 10),
                Row(
                  children: [
                    Image.asset('assets/img/hotKesh/hotKeshPhoneIcon.png',width: 20,height: 20),
                    SizedBox(width: 4),
                    Text('+996 502 003 162',style: TextStyle(
                        color: Color(0xFF313131),
                        fontSize: 14,
                        fontWeight: FontWeight.w400))
                  ],
                ),
                SizedBox(height: 49),
                Text(
                  'Отзывы',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 21),
                Container(
                  height: 350,
                  child: ListView.separated(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: userComment.length,
                    separatorBuilder: (context, index) => SizedBox(height: 20),
                    itemBuilder: (BuildContext context, int index) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/img/category_page/comment/$index.png'))),
                        ),
                        SizedBox(width: 11),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(userComment[index],
                                style: TextStyle(color: Colors.black, fontSize: 12)),
                            SizedBox(height: 10),
                            Container(
                              width: 276,
                              child: Text(
                                comment,
                                style: TextStyle(color: Colors.black, fontSize: 10),
                              ),
                            ),
                            SizedBox(height: 8),
                            RatingBar.builder(
                                ignoreGestures: true,
                                allowHalfRating: true,
                                initialRating: 4.5,
                                itemSize: 12,
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color:AppColors.mainRed,
                                ),
                                onRatingUpdate: (rating) {
                                  setState(() {});
                                }),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text('10:56',
                                    style: TextStyle(
                                        color: Color(0xFF8d8d8d), fontSize: 10)),
                                SizedBox(width: 19),
                                Text('19.10.20',
                                    style: TextStyle(
                                        color: Color(0xFF8d8d8d), fontSize: 10))
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text('Больше отзывов',
                        style: TextStyle(color: AppColors.blue1, fontSize: 12),
                        textAlign: TextAlign.end),
                  ),
                ),
                SizedBox(height: 26),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    thickness: 1.1,
                    color: Color(0xFFdbdbdb),
                  ),
                ),
                SizedBox(height: 20),
                Center(child: Text('Поставить рейтинг и оставить отзыв',style: TextStyle(color: Color(0xFF515151),fontSize: 14))),
                SizedBox(height: 17),
                Center(
                  child: RatingBar.builder(
                      initialRating: 1,
                      itemSize: 19,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.red1,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {});
                      }),
                ),
                SizedBox(height: 34),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    height: 78,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.5,color: Color(0xff929292).withOpacity(0.37)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0x1A000000),
                              blurRadius: 4,
                              offset: Offset(0,4)
                          )
                        ]
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Отзыв',
                          hintStyle: TextStyle(color: Color(0xFFAFAFAF),fontSize: 14)
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 110.0),
                  child: Container(
                    width: 140,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.red1,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text('Отправить',style: TextStyle(color: Colors.white,fontSize: 14),)),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
          
        ],
      ),
    );
  }
}
