import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vente_app/data/app_cubit.dart';
import 'package:vente_app/layouts/colors/const_colors.dart';
import 'package:vente_app/layouts/theme_app/theme_app.dart';
import 'package:vente_app/modules/authentifications/login/login_screens.dart';
import 'package:vente_app/modules/lyouts_screnns/layout_screens.dart';
import 'package:vente_app/modules/on_bording/splash/splash_screens.dart';
import 'package:vente_app/shared/cache_helper/cacheHelpere.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
   await Cachehelper.init();


   Widget widgets;

  var Uid = Cachehelper.getData(key: 'Uid');
  print(Uid);
  var  isDark = Cachehelper.getData(key: 'isDark');
  print(isDark);


  // For Start Widgets
  if(Uid != null){
    widgets = LayoutsScreens();

  }else{
    widgets = SpashScreens();
  }


  runApp(
       MyApp(
         isDark: isDark,
         startWidgets: widgets,
       ),
  );
}

class MyApp extends StatelessWidget {
  final Widget startWidgets;
  final bool? isDark;

   MyApp({super.key,required this.startWidgets,required this.isDark});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        create: (context) => AppCubit()..getUserModel()..getAllPosts(),

      child: BlocConsumer<AppCubit,AppState>(
        listener: (context, state) {},
        builder:(context, state) {

          var cubit = AppCubit.get(context);

        return   MaterialApp(
            title: 'Vente_app',

            theme: LigthTheme,
            darkTheme: darkTheme,
            themeMode:cubit.isDark
                ? ThemeMode.dark
                : ThemeMode.light,

          home: startWidgets,
            // home: SpashScreens(),
            debugShowCheckedModeBanner: false,
          );
        },

      ),
    );
  }
}
