import 'package:flutter/material.dart';
import 'package:upai_app/views/pages/profile/sort.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../shared/app_colors.dart';

class ReferalFilter extends StatefulWidget {
  const ReferalFilter({Key? key}) : super(key: key);

  @override
  _ReferalFilterState createState() => _ReferalFilterState();
}

class _ReferalFilterState extends State<ReferalFilter> {
  DateTime selectedDate1=DateTime.now();
  DateTime selectedDate2=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Text('Сортировать',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 15),
            Text('Дата',style: TextStyle(color: Color(0xFF313131),fontSize: 20)),
            SizedBox(height: 10),
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
                        border: Border.all(width: 1, color: AppColors.blue1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    child: Center(child: Text("${selectedDate1.day}.${selectedDate1.month}.${selectedDate1.year}",style: TextStyle(color: AppColors.blue1,fontSize: 16),)),
                  ),
                ),
                Text('-',style: TextStyle(color: AppColors.blue1,fontSize: 16)),
                GestureDetector(
                  onTap: (){
                    _selectDate2(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 38),
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.blue1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: Text("${selectedDate2.day}.${selectedDate2.month}.${selectedDate2.year}",style: TextStyle(color:AppColors.blue1,fontSize: 16),)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 43),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 91.0),
              child: GestureDetector(
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Sort())),
                child: Container(
                  height: 44,
                  decoration: BoxDecoration(
                      color: AppColors.red1,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Сортировать',style: TextStyle(color: Colors.white,fontSize: 14),),
                  ),
                ),
              ),
            ),
          ],
        ),
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
