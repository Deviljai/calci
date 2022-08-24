import 'package:flutter/material.dart';
import 'package:practice_class/calculator.dart';
import 'package:practice_class/utils/Constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'login.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();
  runApp(MaterialApp(
    title: "Simple App",
    home: Calci(),
  ));
}




