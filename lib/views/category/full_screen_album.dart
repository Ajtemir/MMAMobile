import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenAlbum extends StatefulWidget {
  final int startIndex;
  FullScreenAlbum(this.startIndex);
  @override
  _FullScreenAlbumState createState() => _FullScreenAlbumState();
}

class _FullScreenAlbumState extends State<FullScreenAlbum> {

  @override
  Widget build(BuildContext context) {
    PageController controller=PageController(initialPage: widget.startIndex);
    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PageView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Container(
            child: PhotoView(
              imageProvider:
              AssetImage('assets/img/category_page/galery/$index.png')
            ),
          );
        },
        itemCount: 3,
      ),
    );
  }
}