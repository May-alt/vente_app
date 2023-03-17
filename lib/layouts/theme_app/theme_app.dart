import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vente_app/layouts/colors/const_colors.dart';


/// NAME         SIZE  WEIGHT  SPACING
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5
///


ThemeData darkTheme = ThemeData(

 scaffoldBackgroundColor: backgroundDarkcolor,

  appBarTheme: AppBarTheme(
    backgroundColor: backgroundDarkcolor,
    elevation: 0.0,
    centerTitle: false,
    titleSpacing: 08.0,

    titleTextStyle: TextStyle(color: Colors.white,fontSize: 20.0),
    iconTheme: IconThemeData(color: Colors.white,),

    backwardsCompatibility: false,

    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    )

  ),
  textTheme: TextTheme(
     subtitle1: TextStyle(fontSize: 16,color: white,fontFamily: "lato"),
     subtitle2: TextStyle(fontSize: 14,color: white,fontFamily: "lato"),
     headline6: TextStyle(fontSize: 20,color: white,fontFamily: "lato"),
     bodyText2: TextStyle(color: Colors.black,fontFamily: "lato",fontWeight: FontWeight.bold),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundDarkcolor,
    elevation: 20.0,
    selectedItemColor:selectedItemColorBottomBar,
    selectedLabelStyle: TextStyle(color: selectedItemColorBottomBar,fontWeight: FontWeight.w700),
    unselectedItemColor: unselectedItemColorBottomBar,
  ),

);


ThemeData LigthTheme = ThemeData(
  scaffoldBackgroundColor: backgroundLigthcolor,

  appBarTheme: AppBarTheme(
      backgroundColor: backgroundLigthcolor,
      elevation: 0.0,
      centerTitle: false,
      titleSpacing: 08.0,

      titleTextStyle: TextStyle(color: Colors.black,fontSize: 20.0),
      iconTheme: IconThemeData(color: Colors.black,),

      backwardsCompatibility: false,

      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      )

  ),

  textTheme: TextTheme(
    subtitle1: TextStyle(fontSize: 16,color: Colors.black,fontFamily: "lato"),
    subtitle2: TextStyle(fontSize: 14,color: Colors.black,fontFamily: "lato"),
    headline6: TextStyle(fontSize: 20,color: Colors.black,fontFamily: "lato"),
    bodyText2: TextStyle(color: Colors.black,fontFamily: "lato",fontWeight: FontWeight.bold),
  ),

  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: backgroundLigthcolor,
    elevation: 20.0,
    selectedItemColor:selectedItemColorBottomBar,
    selectedLabelStyle: TextStyle(color: selectedItemColorBottomBar,fontWeight: FontWeight.w700),
    unselectedItemColor: unselectedItemColorBottomBar,
  ),

);