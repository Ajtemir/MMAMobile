import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:upai_app/DTOs/auction_model/unmake_auction_post.dart';
import 'package:upai_app/views/category/collective/form_bottom_modal_collective.dart';
import 'package:upai_app/widgets/appBar2.dart';
import '../../DTOs/auction_model/make_auction_post.dart';
import '../../DTOs/seller_email_and_product_id.dart';
import '../../DTOs/collective_model/submit_collective_argument.dart';
import '../../DTOs/collective_model/unmake_collective_product.dart';
import '../../fetches/about_product_fetch.dart';
import '../../model/aboutProductModel.dart';
import '../../shared/app_colors.dart';
import '../../widgets/date_format.dart';
import '../../service/service.dart';
import '../pages/profileUsers/profileUsers.dart';
import 'auction/form_bottom_modal_auction.dart';
import 'custom_navigation.dart';
import 'full_screen_album.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class AboutMagaz extends StatefulWidget {
  final String productId;
  final String email;
  final bool checkUserPage;

  const AboutMagaz(
      {Key? key,
      required this.productId,
      required this.email,
      required this.checkUserPage})
      : super(key: key);

  @override
  _AboutMagazState createState() => _AboutMagazState();
}

class _AboutMagazState extends State<AboutMagaz> {
  bool isFavorite = false;
  bool? isSetCollective;
  bool? isSetAuction;
  late bool isSeller;
  late bool? isMadeCollectiveOrDefaultNotSeller;
  late AboutProductModel productInfo;

  TextStyle styleTitleInCard =
      const TextStyle(color: AppColors.black, fontSize: 16);

  TextStyle styleSubtitleInCard =
      const TextStyle(color: AppColors.red1, fontSize: 14);

  void _productParentSetState() {
    setState(() {});
  }

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
    futureProductData = fetchProductData(widget.productId, widget.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: FutureBuilder<AboutProductModel>(
        future: fetchProductData(widget.productId, widget.email),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<String> nameAndDescription = [
              snapshot.data!.description!.split('name').first,
              snapshot.data!.description!.split('name').last
            ];
            AboutProductModel path = snapshot.data!;
            productInfo = path;
            isFavorite = path.isFavorite ?? false;
            isSetCollective = path.isSetCollective;
            isSeller = path.isSeller;
            isMadeCollectiveOrDefaultNotSeller =
                isSeller ? path.collectiveInfo != null : null;
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              children: [
                Row(
                  children: [
                    Container(
                      width: 122,
                      height: 122,
                      padding: const EdgeInsets.all(9),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5,
                                offset: Offset(0, 0),
                                color: Color(0x26000000))
                          ]),
                      child: Container(
                          padding: const EdgeInsets.all(9),
                          decoration: const BoxDecoration(
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
                            backgroundImage: NetworkImage(
                                'http://${AuthClient.ip}/${(path.images!.isEmpty ? 'images/default.png' : path.images?[0]) ?? 'images/default.png'}'),
                          )),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Text(
                            nameAndDescription[0],
                            style: const TextStyle(
                              color: Color(0xFF313131),
                              fontSize: 20,
                              overflow: TextOverflow.clip,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(height: 17),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x26000000),
                                        offset: Offset(0, 1),
                                        blurRadius: 4)
                                  ]),
                              child: const Center(
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.green,
                                  size: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 150,
                              child: Text(
                                path.sellerEmail ?? '',
                                overflow: TextOverflow.clip,
                                style: const TextStyle(
                                    color: Color(0xFF535353),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color(0x26000000),
                                        offset: Offset(0, 1),
                                        blurRadius: 4)
                                  ]),
                              child: const Center(
                                child: Icon(
                                  Icons.monetization_on_outlined,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Text(
                              path.price == null
                                  ? 'Договорная цена'
                                  : '${path.price!.round().toString()} сом',
                              style: const TextStyle(
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
                const SizedBox(height: 48),
                const Text(
                  'Описание',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  nameAndDescription[1],
                  style: const TextStyle(
                    color: Color(0xFF515151),
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 30),

                /// Избранный
                if (!(widget.email == path.sellerEmail))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60.0),
                    child: InkWell(
                      onTap: () async {
                        String ans = "null";
                        String ans2 = "null";

                        if (!isFavorite) {
                          print('set');
                          ans = await AuthClient()
                              .getSetFavorite(widget.productId, widget.email);
                        } else {
                          print('unset');
                          ans2 = await AuthClient()
                              .getUnSetFavorite(widget.productId, widget.email);
                        }
                        print(ans + ' ' + ans2);
                        if (ans == 'true') {
                          Fluttertoast.showToast(
                              msg: 'Добавлено',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);

                          setState(() {
                            isFavorite = true;
                          });
                        } else if (ans == 'false') {
                          Fluttertoast.showToast(
                              msg: 'Вышла ошибка!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }

                        if (ans2 == 'true') {
                          Fluttertoast.showToast(
                              msg: 'Убрано',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);

                          setState(() {
                            isFavorite = false;
                          });
                        } else if (ans2 == 'false') {
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
                            color: const Color(0xFFFF6B00),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: isFavorite
                                      ? const Icon(Icons.favorite,
                                          color: Colors.white)
                                      : const Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.white,
                                        )),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  isFavorite
                                      ? 'Убрать из избранного'
                                      : 'Добавить в избранное',
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                const SizedBox(
                  height: 20,
                ),

                ///Коллекативная покупка (User)
                isSetCollective == null
                    ? const SizedBox(
                        height: 0,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.24,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.white),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x40000000).withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Коллективная покупка',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Конец:',
                                    style: styleTitleInCard,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    dateFormat(path.collectiveInfo!.endDate),
                                    style: styleSubtitleInCard,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Количество людей:',
                                    style: styleTitleInCard,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${path.collectiveInfo!.currentBuyerCount} / ${path.collectiveInfo!.minBuyerCount}',
                                    style: styleSubtitleInCard,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Цена товара:',
                                    style: styleTitleInCard,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${path.collectiveInfo!.collectivePrice} сом',
                                    style: styleSubtitleInCard,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(AppColors.red1),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 10)),
                                ),
                                onPressed: () async {
                                  try {
                                    if (isSetCollective!) {
                                      await AuthClient().removeCollective(
                                          path.id!, widget.email);
                                    } else {
                                      await AuthClient().addCollective(
                                          path.id!, widget.email);
                                    }
                                    setState(() {});
                                  } on Exception catch (err) {
                                    print(err);
                                  }
                                },
                                child: Text(
                                  isSetCollective! ? 'Убрать' : 'Добавить',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                ///Коллективная покупка (Seller)
                isMadeCollectiveOrDefaultNotSeller == null
                    ? const SizedBox(
                        height: 0,
                      )
                    : Column(
                        children: <Widget>[
                          _makingCollective(
                              isMadeCollectiveOrDefaultNotSeller!),
                          const SizedBox(
                            height: 20,
                          ),
                          _infoCollective(isMadeCollectiveOrDefaultNotSeller!),
                        ],
                      ),
                const SizedBox(height: 20),

                ///Аукцион (User)
                isSetAuction == null
                    ? const SizedBox(
                        height: 0,
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height * 0.24,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.white),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0x40000000).withOpacity(0.25),
                              blurRadius: 10,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Text(
                              'Аукцион',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Конец:',
                                    style: styleTitleInCard,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    dateFormat(
                                        productInfo.collectiveInfo!.endDate),
                                    style: styleSubtitleInCard,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Начальная цена:',
                                    style: styleTitleInCard,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    // '${productInfo.collectiveInfo!.currentBuyerCount} / ${productInfo.collectiveInfo!.minBuyerCount}',
                                    '20000\$',
                                    style: styleSubtitleInCard,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Текушая цена:',
                                    style: styleTitleInCard,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${productInfo.collectiveInfo!.collectivePrice} сом',
                                    style: styleSubtitleInCard,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(AppColors.red1),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(vertical: 10)),
                                ),
                                onPressed: () async {
                                  TextEditingController suggestPriceController =
                                      TextEditingController();
                                  try {
                                    if (isSetAuction!) {
                                      suggestPriceController.text = "0";
                                      _suggestPriceForm(
                                        suggestPriceController,
                                        'Изменить свою цену',
                                        SellerEmailAndProductId(
                                            productInfo.id!,
                                            productInfo.sellerEmail!,
                                            _productParentSetState),
                                      );
                                      await AuthClient().updateAuction(
                                        productInfo.id!,
                                        widget.email,
                                        double.parse(
                                            suggestPriceController.text),
                                      );
                                    } else {
                                      suggestPriceController.text = "1";
                                      _suggestPriceForm(
                                        suggestPriceController,
                                        'Предложить свою цену',
                                        SellerEmailAndProductId(
                                            productInfo.id!,
                                            productInfo.sellerEmail!,
                                            _productParentSetState),
                                      );
                                      await AuthClient().applyAuction(
                                        productInfo.id!,
                                        widget.email,
                                        double.parse(
                                            suggestPriceController.text),
                                      );
                                    }
                                    setState(() {});
                                  } on Exception catch (err) {
                                    print(err);
                                  }
                                },
                                child: Text(
                                  isSetAuction!
                                      ? 'Изменить'
                                      : 'Предложить свою цену',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                ///Аукцион (Seller)
                isMadeCollectiveOrDefaultNotSeller == null
                    ? const SizedBox(
                        height: 0,
                      )
                    : Column(
                        children: <Widget>[
                          _makingAuction(isMadeCollectiveOrDefaultNotSeller!),
                          const SizedBox(
                            height: 20,
                          ),
                          _infoAuction(isMadeCollectiveOrDefaultNotSeller!),
                        ],
                      ),
                const SizedBox(height: 20),
                const Text(
                  'Галерея',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 13),
                SizedBox(
                  height: 215,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: path.images!.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(
                              MyCustomRoute(
                                  builder: (context) =>
                                      FullScreenAlbum(path.images!)));
                        },
                        child: Container(
                          width: 146,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      'http://${AuthClient.ip}/${path.images![index]}'))),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 26),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Divider(
                    thickness: 1.1,
                    color: Color(0xFFdbdbdb),
                  ),
                ),
                const SizedBox(height: 20),
                if (!widget.checkUserPage &&
                    !(widget.email == path.sellerEmail))
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 90.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                            MyCustomRoute(
                                builder: (context) =>
                                    ProfileUser(emailUser: path.sellerEmail)));
                      },
                      child: Ink(
                        height: 40,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B00),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                          'Страница пользователя',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        )),
                      ),
                    ),
                  ),
                const SizedBox(height: 100),
              ],
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget infoWidget(String icon, String text) {
    return Expanded(
      child: SizedBox(
        width: 145,
        child: Row(
          children: [
            Image.asset(
              'assets/img/category_page/infoIcons/${icon}Icon.png',
              width: 19,
              height: 19,
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Color(0xFF313131),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _makingCollective(bool isMadeCollective) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (isMadeCollective) {
              AuthClient()
                  .unmakeCollective(UnmakeCollectiveArgument(productInfo.id!))
                  .then((value) => _productParentSetState());
            } else {
              showMaterialModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: FormBottomModalCollective(
                      dto: SellerEmailAndProductId(productInfo.id!,
                          productInfo.sellerEmail!, _productParentSetState),
                    ),
                  ),
                ),
              );
            }
          });
        },
        child: Ink(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.red1,
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.add_card_sharp,
                  color: AppColors.white,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  isMadeCollective
                      ? 'Убрать обьявление с групповой скидки'
                      : 'Выставить обьявление на групповую скидку',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _makingAuction(bool isMadeCollective) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (isMadeCollective) {
              AuthClient()
                  .unmakeAuction(UnmakeAuction(
                      sellerEmail: productInfo.sellerEmail!,
                      productId: productInfo.id!))
                  .then((value) => _productParentSetState());
            } else {
              showMaterialModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (context) => SingleChildScrollView(
                  controller: ModalScrollController.of(context),
                  child: Padding(
                    padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: FormBottomModalAuction(
                      dto: SellerEmailAndProductId(productInfo.id!,
                          productInfo.sellerEmail!, _productParentSetState),
                    ),
                  ),
                ),
              );
            }
          });
        },
        child: Ink(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.red1,
          ),
          child: Row(
            children: [
              const Expanded(
                flex: 1,
                child: Icon(
                  Icons.add_card_sharp,
                  color: AppColors.white,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  isMadeCollective
                      ? 'Убрать обьявление об аукционе'
                      : 'Выставить обьявление об аукционе',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoCollective(bool isMadeCollective) {
    if (isMadeCollective) {
      bool isSubmittable = productInfo.collectiveInfo!.currentBuyerCount >=
          productInfo.collectiveInfo!.minBuyerCount;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.transparent),
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(12, 10),
              blurRadius: 30,
            ),
          ],
        ),
        child: Column(
          children: [
            const Text(
              'Коллективная покупка',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Начало',
                        style: styleTitleInCard,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        dateFormat(productInfo.collectiveInfo!.startDate),
                        style: styleSubtitleInCard,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Конец',
                        style: styleTitleInCard,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        dateFormat(productInfo.collectiveInfo!.endDate),
                        style: styleSubtitleInCard,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Количество людей:',
                    style: styleTitleInCard,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${productInfo.collectiveInfo!.currentBuyerCount} / ${productInfo.collectiveInfo!.minBuyerCount}',
                    style: styleSubtitleInCard,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Сумма товара:',
                    style: styleTitleInCard,
                  ),
                ),
                Expanded(
                  child: Text(
                    '${productInfo.collectiveInfo!.collectivePrice} сом',
                    style: styleSubtitleInCard,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      isSubmittable ? AppColors.red1 : AppColors.grey),
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 10)),
                ),
                onPressed: isSubmittable
                    ? () async {
                        if (isSubmittable) {
                          try {
                            await AuthClient().submitCollective(
                                SubmitCollectiveArgument(productInfo.id!));
                            setState(() {});
                          } catch (err) {
                            print(err);
                          }
                        }
                      }
                    : null,
                child: Text(
                  isSubmittable ? 'Подтвердить' : 'Нет нужного количества',
                ),
              ),
            ),
          ],
        ),
      );
    }
    return const SizedBox();
  }

  Widget _infoAuction(bool isMadeAuction) {
    return isMadeAuction == false
        ? const SizedBox(
            height: 0,
          )
        : Container(
            height: MediaQuery.of(context).size.height * 0.24,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.white),
              boxShadow: [
                BoxShadow(
                  color: const Color(0x40000000).withOpacity(0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text(
                  'Аукцион',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Конец:',
                        style: styleTitleInCard,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dateFormat(productInfo.collectiveInfo!.endDate),
                        style: styleSubtitleInCard,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Начальная цена:',
                        style: styleTitleInCard,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        // '${productInfo.collectiveInfo!.currentBuyerCount} / ${productInfo.collectiveInfo!.minBuyerCount}',
                        '45000 сом',
                        style: styleSubtitleInCard,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Текушая цена:',
                        style: styleTitleInCard,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '${productInfo.collectiveInfo!.collectivePrice.toInt()} сом',
                        style: styleSubtitleInCard,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(AppColors.red1),
                      padding: MaterialStatePropertyAll(
                          EdgeInsets.symmetric(vertical: 10)),
                    ),
                    onPressed: () async {
                      try {
                        if (isSetCollective!) {
                          await AuthClient()
                              .removeCollective(productInfo.id!, widget.email);
                        } else {
                          await AuthClient()
                              .addCollective(productInfo.id!, widget.email);
                        }
                        setState(() {});
                      } on Exception catch (err) {
                        print(err);
                      }
                    },
                    child: Text(
                      isSetAuction ?? false ? 'Подтвердить' : 'Клиентов нет',
                    ),
                  ),
                ),
              ],
            ),
          );
  }

  Widget _suggestPriceForm(TextEditingController controller, String title,
      SellerEmailAndProductId dto) {
    final _formKey = GlobalKey<FormBuilderState>();
    return Form(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          FormBuilderTextField(
            name: 'startAuctionPrice',
            enabled: true,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Начальная цена',
              border: OutlineInputBorder(),
            ),
          ),
          MaterialButton(
            color: AppColors.red1,
            onPressed: () async {
              if (_formKey.currentState!.saveAndValidate()) {
                var keyValuePairs = _formKey.currentState?.value;
                if (keyValuePairs != null) {
                  var data = MakingAuctionProduct(
                    startDate: keyValuePairs['startDate'],
                    endDate: keyValuePairs['endDate'],
                    startAuctionPrice:
                        double.parse(keyValuePairs['startAuctionPrice']),
                    email: dto.sellerEmail,
                    productId: dto.productId,
                  );
                  try {
                    await AuthClient().makeAuction(data);
                    Navigator.pop(context);

                    dto.update();
                  } catch (err) {
                    print(err.toString());
                  }
                }
              }
            },
            child: const Text(
              'Опубликовать скидку',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
