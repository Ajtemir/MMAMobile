import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/fetches/categories_fetch.dart';
import 'package:upai_app/model/categoriesModel.dart';
import 'package:upai_app/views/auth/server/service.dart';
import 'package:upai_app/views/pages/categoryProducts.dart';
import 'package:upai_app/views/pages/search_page.dart';
import '../../fetches/products_fetch.dart';
import '../../model/productModel.dart';
import '../../provider/selectCatProvider.dart';
import '../../shared/app_colors.dart';
import '../category/aboutMagaz.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<ListProductsModel> futureProducts;
  Future<CategoriesModel>? futureCategories;
  late String emailGet;

  @override
  void initState() {
    super.initState();
    futureProducts = fetchProducts();
    futureCategories = fetchCategories();
    emailGet = Provider.of<SelectCatProvider>(context, listen: false).email;
  }

  bool leftRight = true;

  List<Widget> listN = [
    Stack(
      fit: StackFit.passthrough,
      children: [
        Container(
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF313131),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x40000000).withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 6))
              ]),
          child: const Padding(
            padding: EdgeInsets.only(left: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 17,
                  right: 143,
                ),
                child: Text(
                  'Кешбэка много не бывает',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.only(right: 112),
                child: Text(
                  "Летай сколько угодно, получай за каждую покупку до 15%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                'До 30.05.2023',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: Image.asset(
              'assets/img/kesh.png',
              height: 180,
              width: 122,
            ))
      ],
    ),
    Stack(
      fit: StackFit.passthrough,
      //overflow: Overflow.visible,
      children: [
        Container(
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF313131),
              boxShadow: [
                BoxShadow(
                    color: const Color(0x40000000).withOpacity(0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 6))
              ]),
          child: const Padding(
            padding: EdgeInsets.only(left: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 17,
                  right: 143,
                ),
                child: Text(
                  'Кешбэка много не бывает',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.only(right: 112),
                child: Text(
                  "Летай сколько угодно, получай за каждую покупку до 15%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                'До 30.12.2020',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: Image.asset(
              'assets/img/kesh.png',
              height: 180,
              width: 122,
            ))
      ],
    ),
    Stack(
      fit: StackFit.passthrough,
      //overflow: Overflow.visible,
      children: [
        Container(
          width: 332,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFF313131),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x40000000).withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                )
              ]),
          child: const Padding(
            padding: EdgeInsets.only(left: 14),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                  top: 17,
                  right: 143,
                ),
                child: Text(
                  'Кешбэка много не бывает',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                  softWrap: true,
                ),
              ),
              SizedBox(height: 7),
              Padding(
                padding: EdgeInsets.only(right: 112),
                child: Text(
                  "Летай сколько угодно, получай за каждую покупку до 15%",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                  softWrap: true,
                ),
              ),
              SizedBox(
                height: 31,
              ),
              Text(
                'До 30.12.2020',
                style: TextStyle(color: Colors.white, fontSize: 10),
              ),
              SizedBox(
                height: 8,
              )
            ]),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 8,
            child: Image.asset(
              'assets/img/kesh.png',
              height: 180,
              width: 122,
            ))
      ],
    ),
  ];
  int slideIndex = 0;
  List<String> CategoryName = [
    'Магазины',
    'Активный отдых',
    'Кино и театры',
    'Кафе и рестораны',
    'Для детей',
    'Игровые клубы',
    'Сауны и бани',
    'Отели и хостелы',
    'Аптеки',
    'Автоуслуги и товары',
    'Косметика и парфюмерия',
    'Оптика',
    'Аксессуары',
    'Товары для дома',
    'Ювелирные изделия',
    'Красота и здровье',
    'SPA и косметология',
    'Химчистка',
    'Зоомагазины',
    'Другое',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/logo.png'))),
        ),
        // elevation: 0,
        backgroundColor: Colors.white,

        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SearchProducts()));
            },
            icon: const Icon(
              Icons.search,
              color: AppColors.blue1,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            /*Padding(
                padding: EdgeInsets.only(left: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 330,
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0xFF225196),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: "Я ищу...",
                            hintStyle: TextStyle(color: Color(0xFF225196)),
                            prefixIcon: Icon(Icons.search,color: AppColors.blue1,),
                            border: InputBorder.none),
                      ),
                    ),
                    SizedBox(
                        child: IconButton(
                      icon: Icon(Icons.filter_alt_outlined,
                          color: AppColors.blue1, size: 28),
                      onPressed: () {
                        */ /*Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Filtr()));*/ /*
                      },
                    ))
                  ],
                ),
              ),*/
            const SizedBox(height: 26),
            CarouselSlider(
              items: listN,
              options: CarouselOptions(
                pageSnapping: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    slideIndex = index;
                  });
                },
                height: 160,
                viewportFraction: 1,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 14,
                  height: 1,
                  color: slideIndex == 0
                      ? AppColors.red1
                      : const Color(0xFFC4C4C4),
                ),
                const SizedBox(width: 9),
                Container(
                  width: 14,
                  height: 1,
                  color: slideIndex == 1
                      ? AppColors.red1
                      : const Color(0xFFC4C4C4),
                ),
                const SizedBox(width: 9),
                Container(
                  width: 14,
                  height: 1,
                  color: slideIndex == 2
                      ? AppColors.red1
                      : const Color(0xFFC4C4C4),
                ),
              ],
            ),
            const ListTile(
              leading: Text(
                'Категории',
                style: TextStyle(color: Color(0xFF313131), fontSize: 16),
              ),
              trailing: Text(
                'Всё',
                style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
              ),
            ),
            FutureBuilder<CategoriesModel>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data!.data!.length;
                  var path = snapshot.data!;
                  return Container(
                    padding: const EdgeInsets.only(left: 14),
                    height: 110,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) =>
                          const SizedBox(width: 0),
                      itemCount: items,
                      itemBuilder: (context, index) => Category(
                          path.data![index].id.toString(),
                          path.data![index].name!,
                          path.data![index].path ?? 'images/default.jpg'),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                  ;
                }

                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              },
            ),

            // ListTile(
            //   leading: Text(
            //     'Рекомендуемые',
            //     style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            //   ),
            //   title: Image.asset(
            //     'assets/img/hotKeshIcon.png',
            //     width: 20,
            //     height: 20,
            //     alignment: Alignment.topLeft,
            //   ),
            //   trailing: Text(
            //     'Всё',
            //     style: TextStyle(color: Color(0xFF313131), fontSize: 12),
            //   ),
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.only(left: 14.0),
            // //   child: Container(
            // //     height: 150,
            // //     child: ListView(
            // //       scrollDirection: Axis.horizontal,
            // //       children: [
            // //         HotKesh(0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
            // //         SizedBox(width: 10),
            // //         HotKesh(1, 3, 27, 'Enter kg', 'Электро техника', 16)
            // //       ],
            // //     ),
            // //   ),
            // // ),
            // ListTile(
            //   leading: Text(
            //     'Новинки',
            //     style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            //   ),
            //   title: Image.asset(
            //     'assets/img/newIcon.png',
            //     width: 20,
            //     height: 20,
            //     alignment: Alignment.topLeft,
            //   ),
            //   trailing: Text(
            //     'Всё',
            //     style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
            //   ),
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.only(left: 14.0),
            // //   child: Container(
            // //     height: 150,
            // //     child: ListView(
            // //       scrollDirection: Axis.horizontal,
            // //       children: [
            // //         HotKesh(2, 4, 193, 'Baby Store', 'Для детей', 14),
            // //         SizedBox(width: 10),
            // //         HotKesh(3, 5, 27, 'Cinematika', 'Кино и театр', 24)
            // //       ],
            // //     ),
            // //   ),
            // // ),
            // ListTile(
            //   leading: Text(
            //     'Товары',
            //     style: TextStyle(color: Color(0xFF313131), fontSize: 16),
            //   ),
            //   trailing: Text(
            //     'Всё',
            //     style: TextStyle(color: Color(0xFF8D8D8D), fontSize: 12),
            //   ),
            // ),
            // // Padding(
            // //   padding: const EdgeInsets.only(left: 14.0),
            // //   child: Container(
            // //     height: 115,
            // //     child: ListView(
            // //       scrollDirection: Axis.horizontal,
            // //       children: [
            // //         Magazine(0, 4.5, 'Эльдорадо', 'электро техника'),
            // //         SizedBox(width: 10),
            // //         Magazine(1, 4, 'LC waikiki', 'Одежда и обувь'),
            // //         SizedBox(width: 10),
            // //         Magazine(2, 5, 'Derimod', 'Одежда и обувь'),
            // //       ],
            // //     ),
            // //   ),
            // // ),
            const SizedBox(
              height: 47,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEBEB),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Flexible(
                      flex: 2,
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
                              'Рекомендуемые',
                              style: TextStyle(
                                  color:
                                      leftRight ? Colors.white : Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 2,
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
                              'Новые',
                              style: TextStyle(
                                  color:
                                      leftRight ? Colors.black : Colors.white,
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
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<ListProductsModel>(
              future: futureProducts,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data!.data!.length;
                  return Center(
                    child: Wrap(
                      runSpacing: 20,
                      spacing: 20,
                      // scrollDirection: Axis.horizontal,
                      children: leftRight
                          ? [
                              /*HotKesh(0, 5, 193, 'Бир Эки бургер', 'Fast food', 25),
                          SizedBox(width: 10),
                          HotKesh(1, 3, 27, 'Enter kg', 'Электро техника', 16),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/1025f602-1814-422a-9b05-be25b5377389.png', 5, 193, 'Сатылат', 'Fast food', 25),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/9492e584-e0bc-4d98-a06b-b55d60afd380.jpg', 3, 27, 'Телефон', 'Электро техника', 16),
                          SizedBox(width: 10),
                          HotKeshSecond('/images/3949ff22-45a3-4251-95d4-1dc2d43f289e.jpg', 2, 42, 'Продается', 'Электро техника', 16),*/
                              for (var i = 0; i < items; i++)
                                HotKeshSecond(
                                    snapshot.data!.data![i].images!.length > 0
                                        ? snapshot.data!.data![i].images![0]
                                        : null,
                                    3,
                                    snapshot.data!.data![i].description!,
                                    snapshot.data!.data![i].price.toString(),
                                    ((snapshot.data!.data![i].id!).toString()),
                                    emailGet,
                                    snapshot.data!.data![i].collectiveInfo),
                            ]
                          : [
                              for (var i = items - 1; i >= 0; i--)
                                HotKeshSecond(
                                    snapshot.data!.data![i].images!.length > 0
                                        ? snapshot.data!.data![i].images![0]
                                        : null,
                                    3,
                                    snapshot.data!.data![i].description!,
                                    snapshot.data!.data![i].price.toString(),
                                    ((snapshot.data!.data![i].id!).toString()),
                                    emailGet,
                                    snapshot.data!.data![i].collectiveInfo),
                              /*HotKesh(2, 4, 193, 'Baby Store', 'Для детей', 14),
                          SizedBox(width: 10),
                          HotKesh(3, 5, 27, 'Cinematika', 'Кино и театр', 24)*/
                            ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                // By default, show a loading spinner.
                return const Center(child: CircularProgressIndicator());
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget Magazine(int image, double rat, String name, String cat) {
    return Container(
      padding: const EdgeInsets.only(left: 5, right: 5, top: 13, bottom: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: const Color(0x1A000000).withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 4)),
          ],
          border: Border.all(
              width: 0.5, color: const Color(0xFF929292).withOpacity(0.37)),
          borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: 100,
        child: Column(
          children: [
            Image.asset(
              'assets/img/magazine/mag$image.png',
              width: 90,
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RatingBar.builder(
                    initialRating: rat,
                    itemSize: 12,
                    itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: AppColors.mainRed,
                        ),
                    onRatingUpdate: (rating) {}),
                const SizedBox(width: 2.5),
                Text(
                  '$rat',
                  style:
                      const TextStyle(color: AppColors.mainRed, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 9),
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 12),
            ),
            Text(
              cat == 'null' ? "Договорная" : cat,
              style: const TextStyle(color: Colors.black, fontSize: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget Category(String id, String name, String image) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                CategoryProducts(categoryId: id, categoryName: name)));
      },
      child: Container(
        width: 89,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0x1A000000).withOpacity(0.1),
                        blurRadius: 4,
                        offset: const Offset(0, 4)),
                  ],
                  border: Border.all(
                      width: 0.5,
                      color: const Color(0xFF929292).withOpacity(0.37)),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Image.network(
                  'https://${AuthClient.ip}:80/$image',
                  height: 22,
                  width: 22,
                ),
              ),
            ),
            const SizedBox(height: 13),
            Text(
              name,
              style: const TextStyle(color: Colors.black, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget HotKesh(
      int image, double rat, int otzyv, String name, String cat, int kesh) {
    return GestureDetector(
      onTap: () {},
      /*=> Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HotKeshPage())),*/
      child: Container(
        width: 170,
        child: Column(
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2.5,
                      color: const Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    const BoxShadow(
                        blurRadius: 7,
                        offset: Offset(0, 6),
                        color: Color(0x33000000))
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/img/hotKesh/kesh$image.jpg'))),
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        RatingBar.builder(
                            initialRating: rat,
                            itemSize: 12,
                            itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: AppColors.mainRed,
                                ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                rat = rating;
                              });
                            }),
                        const SizedBox(width: 2.5),
                        Text(
                          '$rat',
                          style: const TextStyle(
                              color: AppColors.mainRed, fontSize: 12),
                        ),
                        const SizedBox(width: 2),
                        Text(
                          '($otzyv отзыва)',
                          style: const TextStyle(
                              color: Color(0xFF313131), fontSize: 10),
                        )
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      name,
                      style: const TextStyle(
                          color: Color(0xFF313131), fontSize: 12),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      cat,
                      style: const TextStyle(
                          color: Color(0xFF8D8D8D), fontSize: 10),
                    )
                  ],
                ),
                const SizedBox(width: 5),
                Container(
                  width: 20,
                  child: Text(
                    'до $kesh%',
                    textAlign: TextAlign.center,
                    style:
                        const TextStyle(color: AppColors.green, fontSize: 10),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget HotKeshSecond(String? image, double rat, String name, String cat,
      String productId, String email,
      [CollectiveInfo? args]) {
    List<String> nameAndDescription = [
      name.split('name').first,
      name.split('name').last
    ];
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutMagaz(
                productId: productId,
                email: email,
                checkUserPage: false,
              ))),
      child: Ink(
        width: 170,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2.5,
                      color: const Color(0xFF929292).withOpacity(0.37)),
                  boxShadow: [
                    const BoxShadow(
                        blurRadius: 7,
                        offset: Offset(0, 6),
                        color: Color(0x33000000))
                  ],
                  image: image != null
                      ? DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://${AuthClient.ip}:80/$image'))
                      : const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/img/hotKesh/kesh0.jpg'))),
            ),
            const SizedBox(height: 12),
            /*Row(
                      children: [
                        RatingBar.builder(
                            initialRating: rat,
                            itemSize: 12,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: AppColors.mainRed,
                            ),
                            onRatingUpdate: (rating) {
                              setState(() {
                                rat = rating;
                              });
                            }),
                        SizedBox(width: 2.5),
                        Text(
                          '$rat',
                          style:
                          TextStyle(color: AppColors.mainRed, fontSize: 12),
                        ),
                      ],
                    ),*/
            const SizedBox(height: 5),
            Container(
              child: Text(
                nameAndDescription[0],
                style: const TextStyle(color: Color(0xFF313131), fontSize: 16),
                overflow: TextOverflow.clip,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              cat == 'null' ? "Договорная цена" : cat.split('.').first + ' сом',
              style: const TextStyle(color: Colors.orange, fontSize: 14),
            ),
            args == null
                ? const SizedBox(
                    height: 0,
                  )
                : Column(
                    children: [
                      Text(
                        "сейчас ${args.currentBuyerCount}/${args.minBuyerCount} нужно",
                        style:
                            const TextStyle(color: Colors.blue, fontSize: 16),
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "коллективная цена:${args.collectivePrice.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.red, fontSize: 16),
                        overflow: TextOverflow.clip,
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}

class ProductReadViewModel {
  late int minBuyerAmount;
  late int currentBuyerAmount;
  late double collectivePrice;

  static Widget collectiveWidget(ProductReadViewModel? model) {
    return model == null
        ? const SizedBox(
            height: 0,
          )
        : Text(
            "${model.currentBuyerAmount} / ${model.minBuyerAmount} ${model.collectivePrice} сом",
            style: const TextStyle(color: Color(0xFF313131), fontSize: 16),
            overflow: TextOverflow.clip,
          );
  }
}
