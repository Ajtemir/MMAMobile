import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:upai_app/provider/selectCatProvider.dart';
import 'package:upai_app/views/category/selectCategoty.dart';
import 'package:upai_app/widgets/appBar.dart';
import 'package:upai_app/widgets/appBar2.dart';
import '../../shared/app_colors.dart';
import 'utils.dart';

class HotKeshAdd extends StatefulWidget {
  const HotKeshAdd({Key? key}) : super(key: key);

  @override
  _HotKeshAddState createState() => _HotKeshAddState();
}

class _HotKeshAddState extends State<HotKeshAdd> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime selectedDate1=DateTime.now();
  DateTime selectedDate2=DateTime.now();
  String hintText='Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequa...';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: ListView(
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
                          image: AssetImage('assets/img/hotKesh/addIcon.png')),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 85,
                    child: GestureDetector(
                      onTap: (){},
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFF6B00),
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
          SizedBox(height: 17),
          Text('Загрузить аватар',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
          SizedBox(height: 45),
          Padding(
            padding: const EdgeInsets.only(left: 39.0),
            child: Text('Главное фото (450х250)',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
          ),
          SizedBox(height: 7),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: AppColors.blue,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.add,color: Color(0xFFFF6B00),size: 25),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Категория',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                GestureDetector(
                  onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SelectCategory())),
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 19),
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColors.blue),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Provider.of<SelectCatProvider>(context).category==''?
                          Text('Выберите категорию',
                              style: TextStyle(
                                color: Color(0xFFA6A6A6),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              )):
                          Text(Provider.of<SelectCatProvider>(context).category,
                              style: TextStyle(
                                color:AppColors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ))
                        ],
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Название',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Название заведения',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('О горящем кэшбэке',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: hintText,
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Кэшбэк',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Введите % кэшбэка',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Контакты',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Введите телефон',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Text('Время и дата горящего кэшбэка',style: TextStyle(color: Color(0xFF515151),fontSize: 16,fontWeight: FontWeight.w400)),
                ),
                SizedBox(height: 7),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        _selectDate(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("${selectedDate1.day}.${selectedDate1.month}.${selectedDate1.year}",style: TextStyle(color: AppColors.blue,fontSize: 16),)),
                      ),
                    ),
                    Text('-',style: TextStyle(color: AppColors.blue,fontSize: 16)),
                    GestureDetector(
                      onTap: (){
                        _selectDate2(context);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 38),
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: AppColors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("${selectedDate2.day}.${selectedDate2.month}.${selectedDate2.year}",style: TextStyle(color: AppColors.blue,fontSize: 16),)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 49),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 125,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1,color: Color(0xFFFF6B00))
                        ),
                        child: Center(
                          child: Text('Отменить',style: TextStyle(color: Color(0xFFFF6B00),fontSize: 14)),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 125,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF6B00),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(child: Text('Отправить',style: TextStyle(color: Colors.white,fontSize: 14),)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 90),
        ],
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate1)
      setState(() {
        selectedDate1 = selected;
      });
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate2)
      setState(() {
        selectedDate2 = selected;
      });
  }
}
