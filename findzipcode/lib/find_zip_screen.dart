import 'dart:convert';
import 'dart:io';

import 'package:findzipcode/zip_code.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FindZipScreen extends StatefulWidget {
  const FindZipScreen({Key? key}) : super(key: key);

  @override
  State<FindZipScreen> createState() => _FindZipScreenState();
}

class _FindZipScreenState extends State<FindZipScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: 'https://semin-flutter-2.github.io/find-zip-code/index.html',
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
            name: 'zipcode',
            onMessageReceived: (JavascriptMessage message) {
              Map<String, dynamic> json = jsonDecode(message.message);
              ZipCode zipCode = ZipCode.fromJson(json);

              // 결과 전달
              Navigator.pop(context, zipCode);
            }
          ),
        },
      ),
    );
  }
}
