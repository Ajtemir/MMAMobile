import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../fetches/about_product_fetch.dart';
import '../../model/aboutProductModel.dart';
import '../../shared/app_colors.dart';
import '../auth/server/service.dart';
import '../pages/profileUsers/profileUsers.dart';
import 'custom_navigation.dart';
import 'full_screen_album.dart';

class AboutMagaz extends StatefulWidget {
  final String productId;
  final String email;
  final bool checkUserPage;

  const AboutMagaz({Key? key,required this.productId,required this.email,required this.checkUserPage}) : super(key: key);

  @override
  _AboutMagazState createState() => _AboutMagazState();
}

class _AboutMagazState extends State<AboutMagaz> {
  bool isFavorite=false;
  bool? isSetCollective;
  String comment =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua tempor incididunt ut labore et dolore ''';
  List<String> userComment = [
    'Азим Дженалиев',
    'Елена Ворон',
    'Дмитрий Воробьев'
  ];

  late Future<AboutProductModel> futureProductData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    futureProductData=fetchProductData(widget.productId,widget.email);
  }

  @override
  Widget build(BuildContext context) {
    String aboutUs =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ''';
    return Scaffold(
      appBar: AllAppBar2(),
      body: FutureBuilder<AboutProductModel>(
        future: fetchProductData(widget.productId,widget.email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {

            List<String> nameAndDescription=[snapshot.data!.description!.split('name').first,snapshot.data!.description!.split('name').last];
            var path=snapshot.data!;
            isFavorite=path.isFavorite!;
            isSetCollective = path.isSetCollective;
            return
              ListView(
                padding: EdgeInsets.symmetric(horizontal: 14),
                children: [
                  Row(
                    children: [
                      Container(
                        width: 122,
                        height: 122,
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
                          child: CircleAvatar(
                              radius: 53,
                              backgroundImage:
                              NetworkImage('http://${AuthClient.ip}/${(path.images!.isEmpty ? 'images/default.png' : path.images?[0]) ?? 'images/default.png'}'),
                          )
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 150,
                            child: Text(
                              nameAndDescription[0],
                              style: TextStyle(
                                color: Color(0xFF313131),
                                fontSize: 20,
                                overflow: TextOverflow.clip,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 17),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x26000000),
                                          offset: Offset(0, 1),
                                          blurRadius: 4)
                                    ]),
                                child: Center(
                                  child: Icon(Icons.email_outlined,color: Colors.green,size: 16,),
                                ),
                              ),
                              SizedBox(width: 12),
                              Container(
                                width: 150,
                                child: Text(
                                  path.sellerEmail ?? '',
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: Color(0xFF535353),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                width: 26,
                                height: 26,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0x26000000),
                                          offset: Offset(0, 1),
                                          blurRadius: 4)
                                    ]),
                                child: Center(
                                  child: Icon(Icons.monetization_on_outlined,color: Colors.red,size: 16,),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                path?.price==null ? 'Договорная цена': '${path.price!.round().toString()} сом',
                                style: TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 48),
                  Text(
                    'Описание',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    nameAndDescription[1],
                    style: TextStyle(
                      color: Color(0xFF515151),
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 30),
                  if(!(widget.email== path.sellerEmail))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: InkWell(
                      onTap: () async{
                         String ans="null";
                         String ans2="null";

                        if(!isFavorite) {
                          print('set');
                        ans = await AuthClient()
                            .getSetFavorite(widget.productId, widget.email);
                      } else {
                          print('unset');
                        ans2 = await AuthClient()
                            .getUnSetFavorite(widget.productId, widget.email);
                      }
                        print(ans+' '+ans2);
                      if(ans=='true') {
                          Fluttertoast.showToast(
                              msg: 'Добавлено',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);

                          setState(() {
                            isFavorite=true;
                          });
                        }
                        else if(ans=='false'){
                          Fluttertoast.showToast(
                              msg: 'Вышла ошибка!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }

                         if(ans2=='true') {
                           Fluttertoast.showToast(
                               msg: 'Убрано',
                               fontSize: 18,
                               gravity: ToastGravity.BOTTOM,
                               backgroundColor: Colors.green,
                               textColor: Colors.white);

                           setState(() {
                             isFavorite=false;
                           });
                         }
                         else if(ans2=='false'){
                           Fluttertoast.showToast(
                               msg: 'Вышла ошибка!',
                               fontSize: 18,
                               gravity: ToastGravity.BOTTOM,
                               backgroundColor: Colors.red,
                               textColor: Colors.white);
                         }
                      },
                      child: Ink(
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFFFF6B00),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: isFavorite ? Icon(Icons.favorite,color: Colors.white):Icon(Icons.favorite_border_outlined,color: Colors.white,)
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                   isFavorite ? 'Убрать из избранного' : 'Добавить в избранное',
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                const SizedBox(height: 5,),
                isSetCollective == null
                    ? const SizedBox(height: 0,)
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: InkWell(
                          onTap: () {
                            var _isSetCollective = !isSetCollective!;
                              setState(() {
                                isSetCollective = _isSetCollective;
                              });
                          },
                          child: Ink(
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xFFFF6B00),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: isSetCollective!
                                        ? const Icon(Icons.arrow_downward_outlined,
                                            color: Colors.white,
                                        )
                                        : const Icon(
                                            Icons.arrow_upward_outlined,
                                            color: Colors.white,
                                          )),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    isSetCollective! ? 'Убрать' : 'Добавить',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                SizedBox(height: 60),
                  Text(
                    'Галерея',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 13),
                  Container(
                    height: 215,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: path.images!.length,
                      separatorBuilder: (context, index) => SizedBox(width: 10),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(
                                MyCustomRoute(
                                    builder: (context) => FullScreenAlbum(path.images!)));
                          },
                          child: Container(
                            width: 146,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage('http://${AuthClient.ip}/${path.images![index]}'))),
                          ),
                        );
                      },
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
                  if(!widget.checkUserPage && !(widget.email== path.sellerEmail))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.of(context, rootNavigator: true).push(
                            MyCustomRoute(
                                builder: (context) => ProfileUser(emailUser: path.sellerEmail)));
                      },
                      child: Ink(

                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF6B00),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text('Страница пользователя',style: TextStyle(color: Colors.white,fontSize: 14),)),
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              );

          }else if (snapshot.hasError) {
            return Text('${snapshot.error}');;
          }

          // By default, show a loading spinner.
          return Center(child:  CircularProgressIndicator());
        },),



    );
  }

  Widget infoWidget(String icon, String text) {
    return Expanded(
      child: Container(
        width: 145,
        child: Row(
          children: [
            Image.asset(
              'assets/img/category_page/infoIcons/${icon}Icon.png',
              width: 19,
              height: 19,
            ),
            SizedBox(width: 4),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF313131),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
