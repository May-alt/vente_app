import 'package:flutter/material.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/model/post_model.dart';
import 'package:vente_app/model/user_model.dart';

class DetaillesHomeScreens extends StatelessWidget {
   UserModel? userModel;
   final String PostImage;
   final String price;
   final String title;
   final String desc;



   DetaillesHomeScreens({
     Key? key,
     required  this.userModel,
     required this.title,
     required this.PostImage,
     required this.price,
     required this.desc,

   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),

        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage("${userModel!.ProfilImg}"),

            ),
            SizedBox(width: 10.0,),
            Text("${userModel!.name}",style: TextStyle(color: Colors.black),),
          ],
        ),

      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Container(
               height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(PostImage),
                    fit: BoxFit.cover
                ),
              ),
            ),

            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 20.0,),
                    Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,//horizontal
                          children: [
                            Text(
                              "\$${price}",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(height: 10.0,),
                            Text(
                              desc,
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                          ],
                        )
                    ),
                  ],
                )
            ),
          ],
        ),
      ),

    );
  }
}
