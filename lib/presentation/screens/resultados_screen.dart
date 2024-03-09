import 'package:flutter/material.dart';
import 'package:numeros_para_baloto_app/presentation/screens/menu_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ResultadosScreen extends StatelessWidget {
  static const name = 'resultados-screen';
  String url;
  String title;

  ResultadosScreen({Key? key, this.url = '', this.title = ''}) : super(key: key);

  late WebViewController controller;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(url)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: AppBar(
        leading: const LeadingCustom(),
        // title: Image.asset('assets/resultados.png', width: 200,),
        // backgroundColor: Colors.grey.shade100,
        // iconTheme:const IconThemeData(size: ),
      ),
      body: SizedBox(
        height: size.height * .9,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
