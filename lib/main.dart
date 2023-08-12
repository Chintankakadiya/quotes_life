import 'package:flutter/material.dart';
import 'package:quotes_life/screen/detail_page.dart';
import 'package:quotes_life/screen/home.dart';
import 'package:quotes_life/screen/image_detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool connection = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      'detail_page': (context) => Detail_Page(),
      'image_detail_page': (context) => Image_Detail_Page()
    },
  ));
}
