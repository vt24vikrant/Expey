import 'package:expey/data/expense_data.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {

  await Hive.initFlutter();
  await Hive.openBox("expey_database");


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ExpenseData(),
      builder:(context,child)=> const MaterialApp(
        debugShowCheckedModeBanner: false,
      home: HomePage(),
      )
      
    );
  }
}
