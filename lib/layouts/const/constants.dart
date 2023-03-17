import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showTost({
required String msg,
  required TostOptionState state,
})  =>Fluttertoast.showToast(
msg:msg,
toastLength: Toast.LENGTH_SHORT,
gravity: ToastGravity.CENTER,
timeInSecForIosWeb: 5,
backgroundColor:showsTostBackColor(state),
textColor: Colors.white,
fontSize: 16.0
);

enum TostOptionState{SUCCESS, ERROR, WARNING}

Color? showsTostBackColor (TostOptionState state)
{
  Color color;
  switch(state){
    case TostOptionState.SUCCESS:
      color = Colors.green;
      break;
    case TostOptionState.WARNING:
      color = Colors.amber;
      break;
    case TostOptionState.ERROR:
      color = Colors.red;
      break;
  }
  return color;
}


// Widget ReusCircularProgress() => Center(
//   child: CircularProgressIndicator(
//     color: Colors.blue,
//   ),
// );