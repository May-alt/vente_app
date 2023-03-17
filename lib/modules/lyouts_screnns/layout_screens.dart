import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vente_app/data/app_cubit.dart';

class LayoutsScreens extends StatefulWidget {
  const LayoutsScreens({Key? key}) : super(key: key);

  @override
  State<LayoutsScreens> createState() => _LayoutsScreensState();
}

class _LayoutsScreensState extends State<LayoutsScreens> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {},
        builder: (context, state){

        var cubit = AppCubit.get(context);

       return Scaffold(

         // appBar: new AppBar(
         //   elevation: 0.0,
         //   backgroundColor: Colors.white,
         //   title: Text(cubit.titles[cubit.currentIndex],style: TextStyle(color: Colors.black),),
         //   titleSpacing: 10.0,
         //
         // ),

        body: cubit.Screnns[cubit.currentIndex],

            bottomNavigationBar: BottomNavigationBar(
                onTap: (index){
                  print(index);
                 cubit.changeBottomNavigationBar(index);
                  },
                type: BottomNavigationBarType.fixed,
                currentIndex: cubit.currentIndex,
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home_filled),label: "Accueil"),
                  BottomNavigationBarItem(icon: Icon(Icons.post_add,),label: "Post"),
                  BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
                ]),

          );
        },

    );
  }
}
