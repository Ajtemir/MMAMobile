import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:upai_app/views/auth/server/service.dart';
import 'package:upai_app/views/pages/dashboard.dart';
import 'package:upai_app/views/pages/profile/profile.dart';

import '../../../provider/selectTabProvider.dart';
import '../../../shared/app_colors.dart';

class UserEditing extends StatefulWidget {
  final String image;
  final String email;
  const UserEditing({Key? key,required this.image,required this.email}) : super(key: key);

  @override
  _UserEditingState createState() => _UserEditingState();
}

class _UserEditingState extends State<UserEditing> {
  TextEditingController userName=TextEditingController();
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController email=TextEditingController();

  late XFile? imageFile;
  final ImagePicker _picker = ImagePicker();
  bool imageFileCheck=false;

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Выберите фото",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            InkWell(
              onTap: () {
                print('Camera');
                takePhotoCamera();
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.customButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Icon(Icons.camera),
                    SizedBox(height: 10),
                    Text("Камера")
                  ],
                ),
              ),
            ),
            SizedBox(width: 20),
            InkWell(
              onTap: () {
                print('Galery');
                takePhotoGalery();
                // print(imageFile.path);
              },
              child: Ink(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.customButton,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    Icon(Icons.image),
                    SizedBox(height: 10),
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
    final XFile? imageFileTemp = (await _picker.pickImage(source:  ImageSource.gallery))!;
    setState(() {
      imageFile=imageFileTemp!;
      imageFileCheck=true;
    });
  }

  void takePhotoCamera() async {
    /*final pickedFile = await _picker.getImage(
      source: source
    );*/
    final XFile? imageFileTemp= await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile=imageFileTemp!;
      imageFileCheck=true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.blue1, //change your color here
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search,color: AppColors.blue1,),
          ),
        ],
      ),
      backgroundColor: Colors.white,
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

                  Positioned(
                    top: 0,
                    left: 111,
                    child: imageFileCheck? CircleAvatar(

                      radius: 53,
                      backgroundImage: FileImage(File(imageFile!.path)),
                    ) : widget.image!.split('/').last!='null' ? CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 53,
                      backgroundImage: NetworkImage(widget.image),
                    ):CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 53,
                      backgroundImage: AssetImage('assets/img/user.png'),
                    )
                  ),
                  /*Container(
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
                      image: imageFileCheck  ? DecorationImage(
                        fit: BoxFit.cover,
                          image:  FileImage(File(imageFile!.path)),
                    ):DecorationImage(
            image:  AssetImage('assets/img/user.png'),
    )
                    ),
                  ),*/
                  Positioned(
                    top: 0,
                    right: 72,
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.red1,
                        ),
                        child: Image.asset(
                          'assets/img/prof/editingIcon.png',
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
          SizedBox(height: 65,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color:AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: userName,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'User name',
                hintStyle: TextStyle(
                  color: Color(0xFFA6A6A6),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: phoneNumber,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Phone number',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: email,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'email',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            onTap: () async{
              var json={
                "username": userName.text,
                "phoneNumber": phoneNumber.text,
                "email": email.text
              };
              bool ans=await AuthClient().postProfileEdit(json);
              if(ans){
                print('Success');
                if(widget.image!.split('/').last=='null' && imageFileCheck){
                  print('add profile photo');
                  print(widget.email);
                  bool ans2=await AuthClient().postProfilePhotoAdd(imageFile!, widget.email);
                  if(ans2) {
                    Fluttertoast.showToast(
                        msg: 'Сохранено',
                        fontSize: 18,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white);

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: 'Вышла ошибка!',
                        fontSize: 18,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  }
                } else if(widget.image!.split('/').last!='null' && imageFileCheck){
                  bool ans2=await AuthClient().postProfilePhotoAdd(imageFile!, widget.email,true);
                  if(ans2) {
                    Fluttertoast.showToast(
                        msg: 'Сохранено',
                        fontSize: 18,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.green,
                        textColor: Colors.white);

                  }
                  else{
                    Fluttertoast.showToast(
                        msg: 'Вышла ошибка!',
                        fontSize: 18,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.red,
                        textColor: Colors.white);
                  }
                }else{
                  Fluttertoast.showToast(
                      msg: 'Сохранено',
                      fontSize: 18,
                      gravity: ToastGravity.BOTTOM,
                      backgroundColor: Colors.green,
                      textColor: Colors.white);

                 /* Provider.of<SelectTabProvider>(context,
                      listen: false)
                      .toggleSelect(Profile(), 3);*/

                }

              }else{
                print('Error 123');
              }

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 112.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFFF6B00)
                ),
                child: Center(child: Text('Сохранить',style: TextStyle(color: Colors.white,fontSize: 14))),
              ),
            ),
          ),
          SizedBox(height: 42),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Старый пароль',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Новый пароль',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 19),
            height: 45,
            decoration: BoxDecoration(
              border: Border.all(width: 1,color: AppColors.blue1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Повторите новый пароль',
                  hintStyle: TextStyle(
                    color: Color(0xFFA6A6A6),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )
              ),
            ),
          ),
          SizedBox(height: 15),
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 86.0),
              child: Container(
                height: 45,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.red1
                ),
                child: Center(child: Text('Изменить пароль',style: TextStyle(color: Colors.white,fontSize: 14))),
              ),
            ),
          ),
          SizedBox(height: 108),
        ],
      ),
    );
  }
}
