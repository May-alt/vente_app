import 'package:flutter/material.dart';


NavigatorToPage({context, Widget}) => Navigator.of(context).push(
      new MaterialPageRoute(
        builder: (context) {
          return Widget;
        },
      ),
    );

NavAndReplacement({context, Widget}) =>
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Widget,),
    );



NavigatorAndRemove({context, Widget}) =>
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return Widget;
      },
    ), (route) => false);