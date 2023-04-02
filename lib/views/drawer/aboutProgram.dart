import 'package:flutter/material.dart';
import 'package:upai_app/widgets/appBar2.dart';

class AboutProgram extends StatefulWidget {
  const AboutProgram({Key? key}) : super(key: key);

  @override
  _AboutProgramState createState() => _AboutProgramState();
}

class _AboutProgramState extends State<AboutProgram> {
  String text1='''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.''';
  String text2='''Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.

Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. 

Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur?

Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AllAppBar2(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: Column(
          children: [
            ListTile(
              leading: Text('О приложении',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w400)),
            ),
            SizedBox(height: 10),
            Text(text1,style: TextStyle(color: Color(0xFF515151),fontSize: 14)),
            SizedBox(height: 7),
            Text(text2,style: TextStyle(color: Color(0xFF515151),fontSize: 14)),
            SizedBox(height: 50),
            /*Text('Разработано  и поддерживается компанией',textAlign: TextAlign.center,style: TextStyle(color: Color(0xFF4F4F4F),fontSize: 18)),
            SizedBox(height: 13),
            Image.asset('assets/img/oracle.png',width: 109,height: 36),
            SizedBox(height: 50)*/
          ],
        ),
      ),
    );
  }
}
