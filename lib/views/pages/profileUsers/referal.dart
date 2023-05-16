import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upai_app/views/pages/profile/aboutReferal.dart';
import 'package:upai_app/views/pages/profile/allReferal.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../../shared/app_colors.dart';

class Referal extends StatefulWidget {
  const Referal({Key? key}) : super(key: key);

  @override
  _ReferalState createState() => _ReferalState();
}

class _ReferalState extends State<Referal> {
  List<Widget> referal=[
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
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
                      image: AssetImage('assets/img/category_page/comment/0.png')
                  )
              ),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Азим Дженалиев',style: TextStyle(color: Color(0xFF515151),fontSize: 16)),
                SizedBox(height: 7),
                Row(
                  children: [
                    Text('ID123456789',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12)),
                    SizedBox(width: 26),
                    Text('27.10.2020',style: TextStyle(color: Color(0xFF8E8E8E),fontSize: 12))
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
            style: TextStyle(color: Color(0xFF515151),fontSize: 16),
          ),
        )
      ],
    ),
  ];
  int _itemCount=0;
  String text='Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
  @override
  Widget build(BuildContext context) {
    // if(referal.length>0 && referal.length<=3) _itemCount=referal.length;
    // else if(referal.length>3) _itemCount=3;
    return Scaffold(
      appBar: AllAppBar2(),
      body: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(right: 14,left: 14,top: 20),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Реферальная система',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AboutReferal()));
                },
                child: Image.asset('assets/img/prof/bussines/questionIcon.png',width: 20,height: 20),
              ),
            ],
          ),
          SizedBox(height: 25),
          Text(text,style: TextStyle(color: Color(0xFF515151),fontSize: 14)),
          SizedBox(height: 20),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 14),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.blue1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextFormField(
                style: TextStyle(
                  color: AppColors.blue1,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: TextStyle(
                      color: AppColors.blue1.withOpacity(0.4),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'www.marketmall.kg/refral/2d67d764c24226794...'
                ),
              )
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _itemCount=1;
                    });
                    print(_itemCount);
                  },
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:AppColors.red1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/img/prof/referal/copyIcon.png',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Скопировать ссылку',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      _itemCount=0;
                    });
                    print(_itemCount);
                  },
                  child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.red1,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/img/prof/referal/share.png',
                              width: 15,
                              height: 15,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(
                              'Поделиться ',
                              style: TextStyle(color: Colors.white, fontSize: 10),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 41),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Мои рефералы',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AllReferal(referal)));
                },
                child: Text(
                  'Все',
                  style: TextStyle(
                    color: Color(0xFF898989),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          _itemCount>0 ?
          /*Container(
            height: 190,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              itemCount: _itemCount,
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(height: 1,color: Color(0xFFEBEBEB)),
              ),
              itemBuilder: (BuildContext context, int index) {
                return referal[index];
              },
            ),
          )*/
          Column(
            children: [
              referal[0],
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(height: 1,color: Color(0xFFEBEBEB)),
              ),
              referal[0],
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Divider(height: 1,color: Color(0xFFEBEBEB)),
              ),
              referal[0],
            ],
          ):
          Column(
            children: [
              SizedBox(height: 55),
              Text('Здесь пока что пусто',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF6B6B6B),fontSize: 16)),
              Image.asset('assets/img/prof/referal/ifEmpty.png',width: 172,height: 109),
            ],
          )
        ],
      ),
    );
  }
}
