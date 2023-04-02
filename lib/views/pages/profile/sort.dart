import 'package:flutter/material.dart';
import 'package:upai_app/widgets/appBar2.dart';

class Sort extends StatefulWidget {
  const Sort({Key? key}) : super(key: key);

  @override
  _SortState createState() => _SortState();
}

class _SortState extends State<Sort> {
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
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  'assets/img/category_page/comment/0.png'))),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Азим Дженалиев',
                            style: TextStyle(
                                color: Color(0xFF515151), fontSize: 16)),
                        SizedBox(height: 7),
                        Row(
                          children: [
                            Text('ID123456789',
                                style: TextStyle(
                                    color: Color(0xFF8E8E8E), fontSize: 12)),
                            SizedBox(width: 26),
                            Text('27.10.2020',
                                style: TextStyle(
                                    color: Color(0xFF8E8E8E), fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 42,
                  child: Text(
                    '1500 сом',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFF515151), fontSize: 16),
                  ),
                )
              ],
            ),
            SizedBox(height: 37),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      offset: Offset(0,7),
                      blurRadius: 19,
                    )
                  ]),
               child: DataTable(
                 columns: [
                   DataColumn(label: Text('Дата',style: TextStyle(color: Color(0xFF515151),fontSize: 16))),
                   DataColumn(label: Text('Кэшбек',style: TextStyle(color: Color(0xFF515151),fontSize: 16))),
                 ],
                 rows: [
                   DataRow(cells: [
                     DataCell(Text('27.01.20',style: _style)),
                     DataCell(Text('27 сом',style: _style)),
                   ]),
                   DataRow(cells: [
                     DataCell(Text('27.01.20',style: _style)),
                     DataCell(Text('27 сом',style: _style)),
                   ]),
                   DataRow(cells: [
                     DataCell(Text('27.01.20',style: _style)),
                     DataCell(Text('27 сом',style: _style)),
                   ]),
                   DataRow(cells: [
                     DataCell(Text('27.01.20',style: _style)),
                     DataCell(Text('27 сом',style: _style)),
                   ]),
                 ],
               )
            )
          ],
        ),
      ),
    );
  }
}

TextStyle _style=TextStyle(
  color: Color(0xFF7D7D7D),
  fontSize: 14
);