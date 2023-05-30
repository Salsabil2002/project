 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../contstanse.dart';
import 'home_body.dart';
 class Splash extends StatefulWidget {
   @override
   State<Splash> createState() => _SplashState();
 }

 class _SplashState extends State<Splash> {
   navigationFun(BuildContext context) async {
     await Future.delayed(Duration(seconds: 3));
     // bool result = SpHelper.checkFirstTime();
     // if (result) {
     // navigate to new user
     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
       return HomeScreen();
     }));

   }

   @override
   void initState() {
     // TODO: implement initState
     super.initState();
     navigationFun(context);
   }

   @override
   Widget build(BuildContext context) {

     return Scaffold(
       backgroundColor: kPrimaryColor,
       body: Column(
         // verticalDirection: VerticalDirection.up,
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.stretch,

         children: [

           Text(
             "Welcom",
             style: TextStyle(color: Colors.white, fontSize: 20),
             textAlign: TextAlign.center,
           ),
         ],
       ),
     );
   }
 }