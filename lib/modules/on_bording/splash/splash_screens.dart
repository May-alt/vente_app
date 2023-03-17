
import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/modules/authentifications/login/login_screens.dart';
import 'package:vente_app/modules/lyouts_screnns/layout_screens.dart';




class SpashScreens extends StatefulWidget {
  const SpashScreens({Key? key}) : super(key: key);

  @override
  State<SpashScreens> createState() => _SpashScreensState();
}

class _SpashScreensState extends State<SpashScreens> {

  @override
  void initState() {
    //TODO: implement initState
    Timer(
      Duration(seconds: 10),
          () => NavigatorToPage(context: context,Widget: LoginScreens()),
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/Bitmap.png"),
                fit: BoxFit.fill
              )
            ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Shopping \n time",
              textAlign: TextAlign.center,
              style: TextStyle(
                //fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  fontSize: 75,
                fontFamily: 'Cherish',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//   InkWell(
//                onTap: (){
//                  NavAndReplacement(context: context,Widget:LayoutsScreens(), );
//                  },
//                child: Container(
//                  padding: const EdgeInsets.all(10.0),
//                  child:  Text("Let's Shop",
//                    style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),
//                  ),
//                  decoration: BoxDecoration(
//                    //color: Colors.amber,
//                      border: Border.all(color: Colors.black),
//                      borderRadius: BorderRadius.circular(08.0)
//                  ),
//                ),
//              ),