import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key, required this.articleUrl});

  final String articleUrl;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        children: [
          WebView(
          initialUrl : widget.articleUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (url){
            setState(() {
              isLoading = false;
            });
          },
        ),
        if(isLoading == true)
          Center(
            child: CircularProgressIndicator(),
          )

        ]
      )
    );
  }
}
