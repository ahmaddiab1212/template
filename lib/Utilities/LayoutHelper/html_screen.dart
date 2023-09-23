
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class HtmlScreen extends StatelessWidget {
  static const routeName="/htmlScreen";

  final String? html;
  const HtmlScreen({Key? key, this.html}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(),
      body: Html(data: html??""),
    );
  }
}
