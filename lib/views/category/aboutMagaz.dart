import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:upai_app/DTOs/make_collective_post.dart';
import 'package:upai_app/DTOs/submit_collective_argument.dart';
import 'package:upai_app/bloc/reduction_bloc/reduction_bloc.dart';
import 'package:upai_app/bloc/reduction_bloc/states/base_reduction_state.dart';
import 'package:upai_app/model/auction/auction_bloc/Events/base_auction_event.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_bloc.dart';
import 'package:upai_app/model/auction/auction_bloc/auction_state.dart';
import 'package:upai_app/model/auction/auction_detail_model.dart';
import 'package:upai_app/model/auction/auction_state.dart';
import 'package:upai_app/model/auction/auction_widget.dart';
import 'package:upai_app/widgets/appBar2.dart';

import '../../DTOs/unmake_collective_product.dart';
import '../../bloc/reduction_bloc/reduction_event.dart';
import '../../constants/constants.dart';
import '../../fetches/about_product_fetch.dart';
import '../../model/aboutProductModel.dart';
import '../../model/productModel.dart';
import '../../shared/app_colors.dart';
import '../../widgets/date_format.dart';
import '../auth/server/service.dart';
import '../pages/profileUsers/profileUsers.dart';
import 'custom_navigation.dart';
import 'full_screen_album.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:upai_app/DTOs/seller_email_and_product_id.dart';

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
    String aboutUs =
        '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ''';
    return Scaffold(
      appBar: AllAppBar2(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AuctionBloc>(
            create: (context) => AuctionBloc(widget.email, int.parse(widget.productId))..add(InitEvent()),
          ),
          BlocProvider<ReductionBloc>(
            create: (context) => ReductionBloc(int.parse(widget.productId))..add(InitReductionEvent()),
          ),
        ],

        child: FutureBuilder<AboutProductModel>(
          future: fetchProductData(widget.productId, widget.email),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<String> nameAndDescription = [
                snapshot.data!.description!.split('name').first,
                snapshot.data!.description!.split('name').last
              ];
              AboutProductModel path = snapshot.data!;
              productInfo = path;
              isFavorite = path.isFavorite!;
              isSetCollective = path.isSetCollective;
              isSeller = path.isSeller;
              isMadeCollectiveOrDefaultNotSeller =
                  isSeller ? path.collectiveInfo != null : null;
              // AuctionBloc _bloc = BlocProvider.of<AuctionBloc>(context);
              // BlocProvider.of<AuctionBloc>(context, listen: false)
              // _bloc.add(InitialRenderingAuctionEvent(path.auctionDetail, path.auctionState));
              return ListView(
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
                              backgroundImage: NetworkImage(
                                  Constants.addPathToBaseUrl((path.images!.isEmpty ? 'images/default.png' : path.images?[0]) ?? 'images/default.png').toString(),
                              ),
                            )),
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
                                  child: Icon(
                                    Icons.email_outlined,
                                    color: Colors.green,
                                    size: 16,
                                  ),
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
                                  child: Icon(
                                    Icons.monetization_on_outlined,
                                    color: Colors.red,
                                    size: 16,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                              Text(
                                path?.price == null
                                    ? 'Договорная цена'
                                    : '${path.price!.round().toString()} сом',
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
                              color: Color(0xFFFF6B00),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: isFavorite
                                        ? Icon(Icons.favorite,
                                            color: Colors.white)
                                        : Icon(
                                            Icons.favorite_border_outlined,
                                            color: Colors.white,
                                          )),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    isFavorite
                                        ? 'Убрать из избранного'
                                        : 'Добавить в избранное',
                                    style: TextStyle(
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
                  isSetCollective == null
                      ? const SizedBox(
                          height: 0,
                        )
                      : Container(
                          height: MediaQuery.of(context).size.height * 0.2,
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
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
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

                                    ;
                                  },
                                  child: Text(
                                    isSetCollective! ? 'Убрать' : 'Добавить',
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
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
                            _submitDeal(isMadeCollectiveOrDefaultNotSeller!),
                          ],
                        ),
                  SizedBox(height: 60),
                  Center(
                    child: Text(
                      'Аукцион',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<AuctionBloc, BaseAuctionState>(
                    builder: (context, state) {
                      print(state);
                      return state.build(context);
                    },
                  ),
                  SizedBox(height: 60),
                  Center(
                    child: Text(
                      'Тендер',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<ReductionBloc, BaseReductionState>(
                    builder: (context, state) => state.build(context),
                  ),
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
                                  Constants.addPartToBaseUrl(path.images![index]),
                                ),
                              ),
                            ),
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
                            color: Color(0xFFFF6B00),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                              child: Text(
                            'Страница пользователя',
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )),
                        ),
                      ),
                    ),
                  SizedBox(height: 100),
                  // AuctionWidget(state: productInfo.auctionState, auctionDetail: productInfo.auctionDetail),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
              ;
            }

            // By default, show a loading spinner.
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
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

  Widget _makingCollective(bool isMadeCollective) {
    return Column(
      children: [
        Text(
          'Коллективная покупка',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Padding(
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
                      child: FormBottomModal(
                        dto: SellerEmailAndProductId(productInfo.id!,
                            productInfo.sellerEmail!, _productParentSetState),
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
        ),
      ],
    );
  }

  Widget _submitDeal(bool isMadeCollective) {
    if (isMadeCollective) {
      bool isSubmittable = productInfo.collectiveInfo!.currentBuyerCount >=
          productInfo.collectiveInfo!.minBuyerCount;
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        alignment: Alignment.center,
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
            Icon(
              Icons.add_business_rounded,
              color: Colors.white,
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
                      SizedBox(height: 5),
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
                      SizedBox(height: 5),
                      Text(
                        dateFormat(productInfo.collectiveInfo!.endDate),
                        style: styleSubtitleInCard,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
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
            SizedBox(
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

  Widget _auctionDetail(AuctionDetailModel model){
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      alignment: Alignment.center,
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
          Icon(
            Icons.add_business_rounded,
            color: Colors.white,
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
                    SizedBox(height: 5),
                    Text(
                      dateFormat(model.startDate),
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
                    SizedBox(height: 5),
                    Text(
                      dateFormat(model.endDate),
                      style: styleSubtitleInCard,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  'Начальная цена товара:',
                  style: styleTitleInCard,
                ),
              ),
              Expanded(
                child: Text(
                  '${model.startPrice} сом',
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
                  'Нынешняя максимальная цена:',
                  style: styleTitleInCard,
                ),
              ),
              Expanded(
                child: Text(
                  model.currentMaxPrice == null
                  ? "Нет покупателей"
                  : '${model.currentMaxPrice} сом',
                  style: styleSubtitleInCard,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),

          // SizedBox(
          //   width: double.infinity,
          //   child: ElevatedButton(
          //     style: ButtonStyle(
          //       backgroundColor: MaterialStatePropertyAll(
          //            true ? AppColors.red1 : AppColors.grey),
          //       padding: const MaterialStatePropertyAll(
          //           EdgeInsets.symmetric(vertical: 10)),
          //     ),
          //     onPressed: (){},
          //     child: Text(
          //       "Отменить аукцион",
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class FormBottomModal extends StatefulWidget {
  const FormBottomModal({Key? key, required this.dto}) : super(key: key);
  final SellerEmailAndProductId dto;

  @override
  State<FormBottomModal> createState() => _FormBottomModalState();
}

class _FormBottomModalState extends State<FormBottomModal> {
  final _formKey = GlobalKey<FormBuilderState>();
  late SellerEmailAndProductId _dto;
  @override
  void initState() {
    super.initState();
    _dto = widget.dto;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            Text(
              'Выставить обьявление на групповую скидку',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderDateTimePicker(
              validator: (value) {
                if (value == null) {
                  return 'Please enter start Date';
                }
                return null;
              },
              currentDate: DateTime.now(),
              inputType: InputType.both,
              format: DateFormat("yyyy-MM-dd hh:mm"),
              initialDate: DateTime.now(),
              decoration: InputDecoration(
                labelText: "Дата начала",
                border: OutlineInputBorder(),
              ),
              name: 'startDate',
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderDateTimePicker(
              validator: (value) {
                if (value == null) {
                  return 'Please enter end Date';
                }
                return null;
              },
              inputType: InputType.both,
              format: DateFormat("yyyy-MM-dd hh:mm"),
              initialDate: DateTime.now(),
              decoration: InputDecoration(
                labelText: "Дата конца",
                border: OutlineInputBorder(),
              ),
              name: 'endDate',
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              name: 'collectivePrice',
              enabled: true,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Коллективная цена', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 10,
            ),
            FormBuilderTextField(
              validator: (value) {
                if (value == null || int.parse(value) < 2) {
                  return 'Please enter min 2';
                }
                return null;
              },
              decoration: InputDecoration(
                  labelText: "Минимальное количество покупателей",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2)))),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              name: 'minBuyerCount',
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: AppColors.red1,
              onPressed: () async {
                if (_formKey.currentState!.saveAndValidate()) {
                  var keyValuePairs = _formKey.currentState?.value;
                  if (keyValuePairs != null) {
                    var data = MakingCollectiveProduct(
                      startDate: keyValuePairs['startDate'],
                      endDate: keyValuePairs['endDate'],
                      collectivePrice:
                          double.parse(keyValuePairs['collectivePrice']),
                      minBuyerCount: int.parse(keyValuePairs['minBuyerCount']),
                      email: _dto.sellerEmail,
                      productId: _dto.productId,
                    );
                    try {
                      await AuthClient().makeCollective(data);
                      Navigator.pop(context);

                      _dto.update();
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
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class MakeAuctionedForm {
    Widget getWidget(BuildContext context){
      final _formKey = GlobalKey<FormBuilderState>();
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Выставить обьявление на аукцион',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FormBuilderDateTimePicker(
                validator: (value) {
                  if (value == null) {
                    return 'Please enter start Date';
                  }
                  return null;
                },
                currentDate: DateTime.now(),
                inputType: InputType.both,
                format: DateFormat("yyyy-MM-dd hh:mm"),
                initialDate: DateTime.now(),
                decoration: InputDecoration(
                  labelText: "Дата начала",
                  border: OutlineInputBorder(),
                ),
                name: 'startDate',
              ),
              SizedBox(
                height: 10,
              ),
              FormBuilderDateTimePicker(
                validator: (value) {
                  if (value == null) {
                    return 'Please enter end Date';
                  }
                  return null;
                },
                inputType: InputType.both,
                format: DateFormat("yyyy-MM-dd hh:mm"),
                initialDate: DateTime.now(),
                decoration: InputDecoration(
                  labelText: "Дата конца",
                  border: OutlineInputBorder(),
                ),
                name: 'endDate',
              ),
              SizedBox(
                height: 10,
              ),
              FormBuilderTextField(
                name: 'startPrice',
                enabled: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Стартовая цена', border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 10,
              ),
              MaterialButton(
                color: AppColors.red1,
                onPressed: () async {
                  if (_formKey.currentState!.saveAndValidate()) {
                    Map<String, dynamic> keyValuePairs = _formKey.currentState!.value;
                    BlocProvider.of<AuctionBloc>(context).add(AuctionMadeEvent(AuctionDetailModel(
                        keyValuePairs['startDate'],
                        keyValuePairs['endDate'],
                      double.parse(keyValuePairs['startPrice']),
                    )));
                    Navigator.pop(context);
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
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    }
}
