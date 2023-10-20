import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:upai_app/constants/constants.dart';

import '../auth/server/service.dart';

class FullScreenAlbum extends StatefulWidget {
  final List<String> images;
  FullScreenAlbum(this.images);
  @override
  _FullScreenAlbumState createState() => _FullScreenAlbumState();
}

class _FullScreenAlbumState extends State<FullScreenAlbum> {

  @override
  Widget build(BuildContext context) {
    PageController controller=PageController(initialPage: 0,);
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
              minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered*2,

              disableGestures: false,
              imageProvider:
              NetworkImage(Constants.addPartToBaseUrl(widget.images[index]))
            ),
          );
        },
        itemCount: widget.images.length,
      ),
    );
  }
}