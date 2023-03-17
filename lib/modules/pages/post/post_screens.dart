import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vente_app/data/app_cubit.dart';
import 'package:vente_app/layouts/const/constants.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/layouts/reus_widgets/reusibalwidgets.dart';
import 'package:vente_app/modules/pages/home/home_Screens.dart';

class PostScreens extends StatefulWidget {
  const PostScreens({Key? key}) : super(key: key);

  @override
  State<PostScreens> createState() => _PostScreensState();
}

class _PostScreensState extends State<PostScreens> {
  TextEditingController PriceControler = TextEditingController();
  TextEditingController TitleControler = TextEditingController();
  TextEditingController DescControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if(state is UplodPostImgSuccessState){
          showTost(msg: "Your poste a crested", state: TostOptionState.SUCCESS);
          NavigatorToPage(Widget: HomeScreens(),context: context);
        }

      },
      builder: (context, state) {

        var cubit = AppCubit.get(context);
        var userModel = AppCubit.get(context).usermodel;
        var postImg = AppCubit.get(context).PostimagePiked;
        var postModel =AppCubit.get(context).postmodel;


        return Scaffold(

            appBar:  ReusAppBar(
              title: "Post",
              actions: [
                TextButton(

                    onPressed: () {
                     if(AppCubit.get(context).PostimagePiked == null){
                       AppCubit.get(context).CreatNewPost(
                           title: TitleControler.text,
                           Price: PriceControler.text,
                           Des: DescControler.text
                       );
                     }
                     else{
                       AppCubit.get(context).UplodPostImg(
                           title: TitleControler.text,
                           Price: PriceControler.text,
                           Des: DescControler.text

                       );
                     }
                    },
                    child: Text("Upload-Post".toUpperCase()),
                ),
              ],
            ),




            body: AllPaddingPage(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage:
                            NetworkImage("${userModel!.ProfilImg}"),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text("${userModel!.name}",
                        style: Theme.of(context).textTheme.subtitle1,
                      )
                    ],
                  ),


                  // const  SizedBox(height: 15.0,),

                  Expanded(
                    child:  Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: TitleControler,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "de qoui souhaitez-vous discuter?...",
                              hintStyle: Theme.of(context).textTheme.subtitle2,
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none),
                        ),
                        TextFormField(
                          controller: PriceControler,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "58200\$",
                              hintStyle: Theme.of(context).textTheme.subtitle2,
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none),
                        ),
                        TextFormField(
                          controller: DescControler,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: "Description",
                              contentPadding: EdgeInsets.all(10.0),
                              hintStyle: Theme.of(context).textTheme.subtitle2,
                              border: InputBorder.none),
                        ),

                      ],
                    ),//
                  ),




                  if (AppCubit.get(context).PostimagePiked != null)
                    Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(AppCubit.get(context).PostimagePiked!)
                                  as ImageProvider,
                            )),
                          ),
                          Positioned(
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                onPressed: () {
                                  cubit.removePostImg();
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: TextButton.icon(
                          onPressed: () {
                            cubit.getPostImg();
                          },
                          icon: Icon(Icons.image),
                          label: Text("images")),
                    ),
                  ),


                ],),
              ) //AllPaddingPage
            );
      },
    );
  }
}
