import 'package:flutter/material.dart';
import 'package:flutter_advanced_http/widget/fetch_data_page.dart';

void main() => runApp(DemoApp());

class DemoApp extends StatelessWidget {
  const DemoApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Download Demo"),
            ),
            body: Center(
              child: const FetchDataPage(),
            )
        )
    );
  }
}