import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MicrophoneScreen extends StatefulWidget {
  const MicrophoneScreen({Key? key}) : super(key: key);

  @override
  State<MicrophoneScreen> createState() => _MicrophoneScreenState();
}

class _MicrophoneScreenState extends State<MicrophoneScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Голосовой поиск"),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.mic,
              size: 40,
            ),
          ),
          ElevatedButton(onPressed: () {}, child: Text("Поиск")),
        ],
      ),
    );
  }
}
