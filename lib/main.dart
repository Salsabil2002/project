import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screens/home_body.dart';
import 'package:weather/screens/splash.dart';
import 'contstanse.dart';
import 'databaseHerlber.dart';
import 'databaseProvider.dart';
//


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(ChangeNotifierProvider<DbController>(
      create: (context)=>DbController(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      // title: 'Electrical Store',
      // theme: ThemeData(
      //   textTheme:(Theme.of(context).textTheme),
      //   primaryColor: kPrimaryColor,
      //   accentColor: kPrimaryColor,
      // ),
      // Arabic RTL

      // supportedLocales: [Locale("ar", "AE")],
      // locale: Locale("ar", "AE"),

      home: Splash(),
    );
  }

}

