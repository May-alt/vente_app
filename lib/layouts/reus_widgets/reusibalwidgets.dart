import 'package:flutter/material.dart';
import 'package:vente_app/layouts/colors/const_colors.dart';


Widget AllPaddingPage({Widget? child})
=> Padding(
    padding:const EdgeInsets.all(20.0),
  child: child,
);

Widget SymPaddingPage({Widget? child})
=> Padding(
  padding:const EdgeInsets.only(top: 120,left: 20.0,right: 20.0),
  child: child,
);



SettingTileList({
required  Widget? title,
  required Widget? leading,
  required void Function()? onTap,
})
=>  ListTile(
onTap: onTap,
title: title ,
leading: leading,

);

 showAlert(context,Widget? title)
 => showDialog(
     context: context,
     builder: (context) {
       return AlertDialog(
         title: Text("Vous déconnecter de votre compte?",
           style: Theme.of(context).textTheme.bodyText2,
         ),
         actions: [
           TextButton(
             style: TextButton.styleFrom(
               textStyle: Theme.of(context).textTheme.labelLarge,
             ),
             child: const Text('Annuler'),
             onPressed: () {
               Navigator.of(context).pop();
             },
           ),
           TextButton(
             style: TextButton.styleFrom(
               textStyle: Theme.of(context).textTheme.labelLarge,
             ),
             child: const Text('Se Déconnecter'),
             onPressed: () {
             },
           ),
         ],
       );
     },
 );

 /******************** Part( Of authentification (login et register)*********************/
 // Reusibale Text Forem Filde

Widget formFiledText({
 required TextEditingController? controller,
 required Widget? label,
  required Widget? prefixIcon,
  required TextInputType? keyboardType,
  required String? Function(String?)? validator,
  bool obscureText = false,
  IconData? suffix,
  Color? iconsColor,
  void Function()? onPressedSufix,
}) => TextFormField(
  controller: controller,
  validator:validator,
  keyboardType: keyboardType,
  obscureText: obscureText,
  decoration: InputDecoration(
    label:label ,
    prefixIcon:prefixIcon,
    suffixIcon:IconButton(
      onPressed: onPressedSufix,
      icon:Icon(
        suffix,
        color: iconsColor,
      ),
    ),
    contentPadding: EdgeInsets.all(08.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(05.0),
      borderSide: BorderSide(width: 1,),),
    focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(05.0),
           borderSide: BorderSide(width: 1,)
      ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(05.0),
      borderSide: BorderSide(width: 1,color: Colors.red),),

  ),
);


/*************************** btn ***********************/
ReusBtn({
  required String text,
  required void Function()? onTap,
}) => InkWell(
  onTap: onTap,
  child: Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(05.0),
        color: Colors.blue,
    ),
    child: Center(
        child: Text(text.toUpperCase(),
      style: TextStyle(color: white,fontWeight: FontWeight.bold),)),
  ),
);


/*************************** AppBar ***********************/

ReusAppBar({
  List<Widget>? actions,
  required String title,
} ) =>AppBar(

    // backgroundColor: Colors.white,
    // elevation: 0.0,
    // centerTitle: false,
    title: Text(title,),
    actions: actions,

);
















