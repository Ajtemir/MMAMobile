import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:upai_app/bloc/create_product_bloc/create_product_bloc.dart';
import 'package:upai_app/provider/selectCatProvider.dart';
import 'package:upai_app/views/auth/server/service.dart';
import 'package:upai_app/widgets/appBar.dart';
import '../../bloc/create_product_bloc/create_product_events.dart';
import '../../constants/constants.dart';
import '../../model/aboutProductModel.dart';
import '../../provider/selectTabProvider.dart';
import '../../shared/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/dashboard.dart';

class HotKeshAddEdit extends StatefulWidget {
  final String productId;
  final String email;
  late int? currentCategoryId;
  HotKeshAddEdit(
      {Key? key,
        this.currentCategoryId,
        required this.productId,
        required this.email})
      : super(key: key);

  @override
  _HotKeshAddEditState createState() => _HotKeshAddEditState();
}

class _HotKeshAddEditState extends State<HotKeshAddEdit> {
  late String emailGet;
  AboutProductModel? futureProductData;
  bool load=false;
  var categoryId;

  @override
  void initState(){
    // TODO: implement initState
    emailGet = Provider.of<SelectCatProvider>(context, listen: false).email;
    fetchProductData(widget.productId, widget.email);

    print(emailGet);
    super.initState();
  }

  Future<void> fetchProductData(String productId,String email) async {
    final response = await AuthClient().getProductData(productId,email);

    futureProductData=AboutProductModel.fromJson(jsonDecode(response));
    if(futureProductData!=null){
      List<String> nameAndDescription = [
        futureProductData!.description!.split('name').first,
        futureProductData!.description!.split('name').last
      ];
      name.text = nameAndDescription[0];
      description.text = nameAndDescription[1];
      if (futureProductData!.price != null) {
        price.text = futureProductData!.price.toString();
      }
      imageFromNetwork = futureProductData!.images!;
      categoryId=futureProductData!.categoryId;
    }
    setState(() {
      load=true;
    });
  }
  DateTime selectedDate1 = DateTime.now();
  DateTime selectedDate2 = DateTime.now();

  String hintText = 'Введите описания';

  List<XFile> imageFile = [];
  List<String> imageFromNetwork = [];
  late XFile imageFileCamera;
  final ImagePicker _picker = ImagePicker();

  TextEditingController price = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();

  Widget bottomSheet() {
    return Container(

      height: 120,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          
          const Text(
            "Выберите фото",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                print('Camera');
                takePhotoCamera();
                print(imageFileCamera.path);
              },
              child: Ink(
                padding: EdgeInsets.all(5),
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.customButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(height: 7),
                    Text("Камера")
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: () {
                print('Galery');
                takePhotoGalery();
                print(imageFile[0].path);
              },
              child: Ink(
                padding: EdgeInsets.all(5),
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.customButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Column(
                  children: [
                    Icon(Icons.image),
                    SizedBox(height: 7),
                    Text("Гелерея")
                  ],
                ),
              ),
            ),

            /*IconButton(onPressed: (){
              takePhoto(ImageSource.camera);
            }, icon: Icon(Icons.camera),
            ),*/

            /*Expanded(
              child: ElevatedButton.icon(

                icon: Icon(Icons.camera),
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                label: Text(''),
              ),
            ),*/
            /*IconButton(onPressed: (){takePhoto(ImageSource.gallery);}, icon: Icon(Icons.image),),*/
            /*Expanded(
              child: ElevatedButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                label: Text(''),
              ),
            ),*/
          ])
        ],
      ),
    );
  }



  void takePhotoGalery() async {
    /*final pickedFile = await _picker.getImage(
      source: source
    );*/
    final List<XFile> images = await _picker.pickMultiImage();
    setState(() {
      imageFile.addAll(images);
    });
  }

  void takePhotoCamera() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile.add(photo!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AllAppBar(),
      body: load ? ListView(
        children: [
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Подать объявление',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400)),
          ),
          const SizedBox(height: 30),
          ListTile(
            contentPadding:
            const EdgeInsets.only(left: 35, right: 20, bottom: 0),
            leading: const Text(
              'Загрузите фото',
              style: TextStyle(
                  color: Color(0xFF515151),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            trailing: IconButton(
                onPressed: () {
                  imageFile = [];
                  imageFromNetwork = [];
                  setState(() {});
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.orange,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (imageFromNetwork.length > 0)
                  Container(
                    height: 80,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, _) =>
                          const SizedBox(width: 5),
                      itemCount: imageFromNetwork.length,
                      itemBuilder: (context, index) => Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: AppColors.blue,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  Constants.addPartToBaseUrl(
                                      imageFromNetwork[index])),
                            )),
                      ),
                    ),
                  ),
                if (imageFile.length > 0)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (imageFromNetwork.length > 0)
                      SizedBox(height: 20),
                      if (imageFromNetwork.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Text('Новые фото',style: TextStyle(
                            color: Color(0xFF515151),
                            fontSize: 16,
                            fontWeight: FontWeight.w400)),
                      ),
                      if (imageFromNetwork.length > 0)
                      SizedBox(height: 20),
                      Container(
                        height: 80,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, _) =>
                              const SizedBox(width: 5),
                          itemCount: imageFile.length,
                          itemBuilder: (context, index) => Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1,
                                  color: AppColors.blue,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                      File(imageFile[index].path)),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: ((builder) => bottomSheet()),
                    );
                  },
                  child: Container(
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
                    child: const Icon(Icons.add,
                        color: Color(0xFFFF6B00), size: 25),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text('Название',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 7),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        border: InputBorder.none,
                        hintText: 'Название объявления',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text('Описания объявления',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 7),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  height: 90,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: description,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        border: InputBorder.none,
                        hintText: 'Введите описание',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 19.0),
                  child: Text('Цена',
                      style: TextStyle(
                          color: Color(0xFF515151),
                          fontSize: 16,
                          fontWeight: FontWeight.w400)),
                ),
                const SizedBox(height: 7),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  height: 45,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.blue),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: price,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        border: InputBorder.none,
                        hintText: 'Введите цену',
                        hintStyle: TextStyle(
                          color: Color(0xFFA6A6A6),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        )),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        String descriptionText =
                            name.text + 'name' + description.text;
                        var json = {
                          "name" : name.text,
                          "description": descriptionText,
                          "price": price.text,
                          "productId" : widget.productId
                        };
                        int ans =
                        await AuthClient().postProductUpdate(json);
                        if (ans != 0) {
                          print('correct');
                          if(imageFromNetwork.isEmpty){
                            print('deleting');
                            bool ans = await AuthClient()
                                .postProductImagesDelete(widget.productId);
                            if(ans) print('Удалено');
                          }
                          if(imageFile.isNotEmpty){
                            bool ans2 = await AuthClient()
                                .postProductPhotoAdd(imageFile, int.parse(widget.productId));

                          }
                          /*BlocProvider.of<CreateProductBloc>(context)
                              .add(ChooseCategoryEvent(
                              categoryId,
                              int.parse(widget.productId)));
                          return;*/
                          Fluttertoast.showToast(
                              msg: 'Успешно изменено!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white);
                          Navigator.pop(context);
                          /*bool ans2 = await AuthClient()
                              .postProductPhotoAdd(imageFile, ans);
                          if (ans2) {
                            BlocProvider.of<CreateProductBloc>(context)
                                .add(ChooseCategoryEvent(
                                int.parse(
                                    Provider.of<SelectCatProvider>(
                                        context,
                                        listen: false)
                                        .categoryId),
                                ans));
                            return;
                            Fluttertoast.showToast(
                                msg: 'Успешно добавлено!',
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white);
                            Provider.of<SelectTabProvider>(context,
                                listen: false)
                                .toggleSelect(Dashboard(), 0);
                          } else {
                            Fluttertoast.showToast(
                                msg: 'Вышла ошибка!',
                                fontSize: 18,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.red,
                                textColor: Colors.white);
                          }*/
                        } else {
                          Fluttertoast.showToast(
                              msg: 'Error!',
                              fontSize: 18,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white);
                        }
                      },
                      child: Ink(
                        width: 125,
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFFFF6B00),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                            child: Text(
                              'Отправить',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14),
                            )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 90),
        ],
      ) : const Center(child: CircularProgressIndicator(),),
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate1,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate1) {
      setState(() {
        selectedDate1 = selected;
      });
    }
  }

  _selectDate2(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate2,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate2) {
      setState(() {
        selectedDate2 = selected;
      });
    }
  }
}
