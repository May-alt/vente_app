import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vente_app/data/app_cubit.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/layouts/reus_widgets/reusibalwidgets.dart';
import 'package:vente_app/modules/authentifications/login/login_screens.dart';
import 'package:vente_app/shared/cache_helper/cacheHelpere.dart';

class SettingsScreens extends StatefulWidget {
  const SettingsScreens({Key? key}) : super(key: key);

  @override
  State<SettingsScreens> createState() => _SettingsScreensState();
}

class _SettingsScreensState extends State<SettingsScreens> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
     listener: (context, state) {
       // if( state is logOutAppState){
       //   Cachehelper.removeData(key: 'Uid');
       //   showAlert(context, Text("Logout "));
       //   NavigatorAndRemove(context: context,Widget: LoginScreens());
       // }
     },
       builder: (context, state) {

       var cubit = AppCubit.get(context);
       var usermodel = AppCubit.get(context).usermodel;

         return Scaffold(
           appBar: ReusAppBar(
             title: "Settings"
           ),

           body:AllPaddingPage(
             child:  Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,//vertical
               children: [
                 CircleAvatar(
                   radius: 60.0,
                   backgroundImage: NetworkImage("${usermodel!.ProfilImg}"),
                 ),

                 const SizedBox(height:15.0,),
                 Text("${usermodel!.name}",
                   style: Theme.of(context).textTheme.headline6,
                 ),


                 const SizedBox(height: 45.0,),


                 SettingTileList(
                   leading:Icon(Icons.person,color: Colors.blue,),
                   onTap: (){},
                   title: Text("Profil",style:Theme.of(context).textTheme.subtitle1,),
                 ),


                 SettingTileList(
                   leading:cubit.isDark
                   ? Icon(Icons.light,color: Colors.amber,)
                   :Icon(Icons.dark_mode,color: Colors.black,)
                   ,
                   onTap: (){
                     AppCubit.get(context).changeModeApp();
                   },
                   title: cubit.isDark
                   ?Text("Ligth Mode",style:Theme.of(context).textTheme.subtitle1,)
                   :Text("Dark Mode",style:Theme.of(context).textTheme.subtitle1,),

                 ),

                 const Divider(color: Colors.grey),

                 SettingTileList(
                   leading:Icon(Icons.logout,color: Colors.red,),
                   onTap: (){

                     showDialog(
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
                                 print("deconnexion");
                               //  cubit.logOut();
                               },
                             ),
                           ],
                         );
                       },
                     );




                   },
                   title: Text("LogOut",
                     style:Theme.of(context).textTheme.subtitle1,
                   ),
                 ),

               ],
             ),
           ),
         );
       },
   );
  }
}
