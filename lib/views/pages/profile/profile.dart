import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upai_app/views/pages/profile/allMagazine.dart';
import 'package:upai_app/views/pages/profile/bussinessProf.dart';
import 'package:upai_app/views/pages/profile/profileEditing.dart';
import 'package:upai_app/views/pages/profile/purseSetting.dart';
import 'package:upai_app/views/pages/profile/referal.dart';
import 'package:upai_app/widgets/appBar.dart';

import '../../../shared/app_colors.dart';
import '../../auth/sing_in/sing_in_screen.dart';
import 'faq.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar(),
      body: ListView(
        padding: EdgeInsets.only(left: 14, right: 14, top: 5),
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
                //overflow: Overflow.visible,
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
                          image: AssetImage('assets/img/user.png')),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 72,
                    child: GestureDetector(
                      onTap: (){Navigator.of(context).push(MaterialPageRoute(builder:(context)=>UserEditing()));},
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.red1,
                        ),
                        child: Image.asset(
                          'assets/img/penIcon.png',
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
          SizedBox(height: 4),
          Text(
            'Акиева Айпери',
            style: TextStyle(color: Colors.black, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Color(0xFF313131),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                              'assets/img/profIconTab1.png',
                              width: 72,
                              height: 72,
                            ),
                            bottom: -28,
                            left: 15),
                        Positioned(
                          top: 20,
                          left: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('14',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(
                                'Объявлений',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: VerticalDivider(
                    color: Color(0xFF636363),
                    width: 1,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                              'assets/img/profIconTab2.png',
                              width: 72,
                              height: 72,
                            ),
                            bottom: -28,
                            left: 15),
                        Positioned(
                          top: 15,
                          left: 22,
                          child: Container(
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('21 834',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                                Text(
                                  'общая сумма оплаты',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 10),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 11),
                  child: VerticalDivider(
                    color: Color(0xFF636363),
                    width: 1,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Stack(
                      children: [
                        Positioned(
                            child: Image.asset(
                              'assets/img/profIconTab3.png',
                              width: 72,
                              height: 72,
                            ),
                            bottom: -28,
                            left: 15),
                        Positioned(
                          top: 20,
                          left: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('1520',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)),
                              Text(
                                'на счету',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AllMagazine())),
            // dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            leading: Text(
              'Мои объявления',
              style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            ),
            trailing: Text(
              'Всё',
              style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
            ),
          ),
          PokupkiContainer(0, '15.10.20', 'Эльдорадо', '1 200', '649'),
          SizedBox(height: 10),
          PokupkiContainer(2, '10.10.20', 'Derimod', '4 500', '278'),
          SizedBox(height: 10),
          PokupkiContainer(3, '15.10.20', 'Magazin', '1 990', '180'),
          SizedBox(height: 33),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 96),
            child: GestureDetector(
              onTap: (){
              },
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(width: 1,color: AppColors.blue1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(child: Text('Вывести деньги',style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.blue1,fontSize: 14),)),
              ),
            ),
          ),
          SizedBox(height: 30),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(1, 'Пригласить друга',Referal()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(2, 'Настройки кошелька',PurseSetting()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(3, 'FAQ',FAQ()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          CatFun(4, 'Бизнес профиль',BussinesProf()),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
          ListTile(
            leading: Image.asset('assets/img/prof/catIcon5.png',width: 16,height: 16),
            title: Text('Поделиться приложением',style: TextStyle(color: Color(0xFF313131),fontSize: 16,fontWeight: FontWeight.w400),),
          ),
          Divider(height: 1,color: Color(0xFFEBEBEB)),
        ListTile(
          onTap: ()=>Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => SingInScreen())),
          leading: Image.asset('assets/img/prof/catIcon6.png',width: 16,height: 16),
          title: Text('Выход',style: TextStyle(color: Color(0xFF313131),fontSize: 16,fontWeight: FontWeight.w400),),
        ),
          SizedBox(height: 99),
        ],
      ),
    );
  }

  Widget CatFun(int imageIndex,String funName,Widget widgetForCat){
    return ListTile(
      onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>widgetForCat)),
      leading: Image.asset('assets/img/prof/catIcon$imageIndex.png',width: 16,height: 16),
      title: Text(funName,style: TextStyle(color: Color(0xFF313131),fontSize: 16,fontWeight: FontWeight.w400),),
    );
  }


  Widget PokupkiContainer(int imageIndex,String date,String name,String plata,String ostatok){
    return Container(
      height: 86,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 0.5, color: Color(0xFF929292).withOpacity(0.37)),
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 5,
            )
          ]),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/img/magazine/mag$imageIndex.png',
                  width: 90,
                  height: 30,
                ),
                SizedBox(height: 6),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/img/prof/likeIcon.png',
                        width: 13,
                        height: 13,
                      ),
                      SizedBox(width: 4,),
                      Text(
                        'Оставить отзыв',
                        style: TextStyle(color: Colors.black, fontSize: 10),
                      ),
                    ]),
                Text(
                  '$dateг',
                  style:
                  TextStyle(color: Color(0xFF8D8D8D), fontSize: 10),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 11),
            child: VerticalDivider(
              color: Color(0xFFEBEBEB),
              width: 1,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(name,style: TextStyle(color: Color(0xFF313131),fontSize: 14),),
                SizedBox(height: 14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/prof/somIcon.png',width: 15,height: 15,),
                    SizedBox(width: 5),
                    Text('$plata сом',style: TextStyle(color: Color(0xFF515151),fontSize: 10),),
                  ],
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/img/prof/somIcon2.png',width: 15,height: 15,),
                    SizedBox(width: 3),
                    Text('$ostatok сом',style: TextStyle(color: Color(0xFF515151),fontSize: 10),),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
