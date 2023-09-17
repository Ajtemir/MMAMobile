import 'package:flutter/material.dart';
import 'package:upai_app/views/pages/profile/referalFilter.dart';
import 'package:upai_app/widgets/appBar2.dart';

class AllReferal extends StatefulWidget {
  List<Widget> referal;
  AllReferal(this.referal);

  @override
  _AllReferalState createState() => _AllReferalState();
}

class _AllReferalState extends State<AllReferal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            ListTile(
              leading: Text('Мои рефералы',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
              trailing: GestureDetector(
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReferalFilter())),
                child: Image.asset(
                  'assets/img/category_page/filterIcon.png',
                  width: 20,
                  height: 18,
                ),
              ),
            ),
            Container(
              height: 450,
              child: ListView.separated(
                itemCount: widget.referal.length,
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Divider(height: 1, color: Color(0xFFEBEBEB)),
                ),
                itemBuilder: (BuildContext context, int index) {
                  return widget.referal[index];
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
