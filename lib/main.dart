import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';
import 'package:to_do_list/Screens/home.dart';

void main() async {
  
  await Hive.initFlutter();
  var myBox = await Hive.openBox('myBox');
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Main()));
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
