import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:vente_app/data/app_cubit.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/layouts/reus_widgets/reusibalwidgets.dart';
import 'package:vente_app/model/post_model.dart';
import 'package:vente_app/model/user_model.dart';
import 'package:vente_app/modules/pages/home/detailles_widgets/detailles_home_screens.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({Key? key}) : super(key: key);

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {

        var cubit = AppCubit.get(context);
        var userModel = AppCubit.get(context).usermodel;
        var postModel = AppCubit.get(context).posts;


        return AppCubit.get(context).posts.length > 0 && AppCubit.get(context).usermodel != null
            ? Scaffold(

                appBar: ReusAppBar(title: "Home"),


                body: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 1,
                        childAspectRatio: 1 /2),

                    itemCount: AppCubit.get(context).posts.length,

                    itemBuilder: (context, index) {
                      return PostSection(userModel,AppCubit.get(context).posts[index],index);
                    }),
              )
            :

        Center(
                child: CircularProgressIndicator(
                  color: Colors.pink,
                ),
       );
      },
    );
  }


  Widget PostSection(userModel,PostModel postmodel, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(

          decoration: BoxDecoration(
            //   color: Colors.transparent,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.grey,
            //     offset: Offset(0, 4),
            //     blurRadius: 2
            //   )
            // ],
             border: Border.all(color: Colors.grey)
  ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: EdgeInsets.only(left: 05.0, top: 05.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage("${userModel!.ProfilImg}"),
                    ),
                    const SizedBox(
                      width: 08.0,
                    ),
                    Text("${userModel.name}", style: Theme.of(context).textTheme.subtitle1,)
                  ],
                ),
              ),


              const SizedBox(
                height: 08.0,
              ),


              Expanded(
                child: InkWell(
                  onTap: () {
                    NavigatorToPage(
                      context: context,
                      Widget: DetaillesHomeScreens(
                          userModel:AppCubit.get(context).usermodel!,
                          title: postmodel!.title as String,
                         PostImage:postmodel!.Postimage as String ,
                         price: postmodel!.Price as String,
                        desc: postmodel!.desc as String,
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    child:postmodel!.Postimage != null
                        ?
                    FadeInImage.assetNetwork(
                      placeholder:"assets/images/loading.gif",
                      image:"${postmodel!.Postimage}",
                      fit: BoxFit.cover,
                    )
                        :
                    Image.asset("assets/images/loading.gif",fit: BoxFit.cover,),
                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //
                    //       image: NetworkImage("${postmodel!.Postimage}"),
                    //
                    //       fit: BoxFit.cover),
                    // ),
                  ),
                ),
              ),

              const SizedBox(
                height: 08.0,
              ),

              Padding(
                padding: EdgeInsets.only(left: 05.0),
                child: Text("${postmodel.title}",
                    maxLines: 1, overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle2,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("\$${postmodel.Price}",
                    style: Theme.of(context).textTheme.subtitle2,
                  ),

                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite,color: Colors.grey,),
                  ),
                ],
              ),


            ],
          ),
        ),
      );







}
