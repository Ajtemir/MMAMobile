import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class PaymentScreen extends StatefulWidget {
  final String urlPay;
  PaymentScreen({super.key, required this.urlPay});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  WebViewPlusController? _controller;
  int pageCounter = 0;
  double webProgress = 0;
  @override
  Widget build(BuildContext context) {
    print(widget.urlPay);
    String urlTemp = '';
    for (var i = 1; i <= widget.urlPay.length - 2; i++) {
      urlTemp = urlTemp + widget.urlPay[i];
    }
    print(urlTemp);
    return Scaffold(
        body: SafeArea(
      child: Stack(children: [
        WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          gestureNavigationEnabled: true,
          onWebViewCreated: (controller) {
            _controller = controller;
          },
          onProgress: (progress) {
            setState(() {
              this.webProgress = progress / 100;
            });
          },
          initialUrl: urlTemp,
          /*navigationDelegate: (NavigationRequest request) {
            pageCounter++;
            print(pageCounter);
            if (pageCounter == 1 && Platform.isAndroid) {
              Navigator.of(context).pop();
              return NavigationDecision.prevent;
            }
            if (pageCounter == 4 && Platform.isIOS) {
              Navigator.of(context).pop();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },*/
        ),
        if (webProgress < 1)
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          ),
      ]),
    ));
  }
}
