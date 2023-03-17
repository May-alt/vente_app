import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vente_app/layouts/const/constants.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/layouts/reus_widgets/reusibalwidgets.dart';
import 'package:vente_app/modules/authentifications/login/login_screens.dart';
import 'package:vente_app/modules/authentifications/register/cubit_register/register_cubit.dart';
import 'package:vente_app/modules/lyouts_screnns/layout_screens.dart';
import 'package:vente_app/shared/cache_helper/cacheHelpere.dart';

class RegisterScreens extends StatefulWidget {
  const RegisterScreens({Key? key}) : super(key: key);

  @override
  State<RegisterScreens> createState() => _RegisterScreensState();
}

class _RegisterScreensState extends State<RegisterScreens> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
       create:(context) => RegisterCubit(),
     child: BlocConsumer<RegisterCubit,RegisterState>(
       listener: (context, state) {

         if(state is RegisterErrorState){
           showTost(msg: state.error, state: TostOptionState.ERROR);
         }

         if(state is RegisterSuccessState){
           showTost(msg: "Success account", state: TostOptionState.SUCCESS);
           NavigatorAndRemove(
             Widget: LayoutsScreens(),
             context: context,
           );
         }



       },
         builder: (context, state) {

          var cubit = RegisterCubit.get(context);

           return Container(
             height: double.infinity,
             width: double.infinity,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage("assets/images/bg.png"),
               ),
             ),
             child: Scaffold(

               body: Container(
                 height: double.infinity,
                 width: double.infinity,
                 decoration: BoxDecoration(
                   image: DecorationImage(
                       image: AssetImage("assets/images/bg.png"), fit: BoxFit.fill),
                 ),
                 child:  SingleChildScrollView(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(vertical: 100.0,horizontal: 20),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.center, //horizontal
                       mainAxisAlignment: MainAxisAlignment.center, //vertical
                       children: [

                         Container(
                           height: 250,
                           width: 250,
                           decoration: BoxDecoration(
                             image: DecorationImage(image: AssetImage("assets/images/logo2.png"),),
                           ),
                         ),

                         const SizedBox(
                           height: 15.0,
                         ),

                         Form(
                           key: formkey,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [

                               formFiledText(
                                   controller: nameController,
                                   label: Text(" nom d'utilisateur"),
                                   prefixIcon: Icon(Icons.person),
                                   keyboardType: TextInputType.text,
                                   validator: (val) {
                                     if (val == null || val.isEmpty) {
                                       return "your name is empty";
                                     }
                                   }),

                               const SizedBox(
                                 height: 15.0,
                               ),

                               formFiledText(
                                   controller: emailController,
                                   label: Text("E-mail"),
                                   prefixIcon: Icon(Icons.email),
                                   keyboardType: TextInputType.emailAddress,
                                   validator: (val) {
                                     if (val == null || val.isEmpty) {
                                       return "your mail is empty";
                                     }
                                   }),

                               const SizedBox(
                                 height: 15.0,
                               ),

                               formFiledText(
                                   controller: phoneController,
                                   label: Text("num de telephone"),
                                   prefixIcon: Icon(Icons.phone_enabled),
                                   keyboardType: TextInputType.phone,
                                   validator: (val) {
                                     if (val == null || val.isEmpty) {
                                       return "your phone is empty";
                                     }
                                   }),

                               const SizedBox(
                                 height: 15.0,
                               ),

                               formFiledText(
                                   controller: passwordController,
                                   label: Text("Mot de passe"),
                                   obscureText: cubit.isPassword,
                                   prefixIcon: Icon(Icons.lock),
                                   suffix: cubit.suffix,
                                   onPressedSufix: (){
                                     RegisterCubit.get(context).changeVisibilitePassword();
                                   },
                                   keyboardType: TextInputType.visiblePassword,
                                   validator: (val) {
                                     if (val == null || val.isEmpty) {
                                       return "your password is empty";
                                     }
                                   }),

                               // Align(
                               //   alignment: AlignmentDirectional.topEnd,
                               //   child: TextButton(onPressed: (){}, child: Text("Forget password?")),
                               // ),

                               const SizedBox(height: 10.0),

                               ReusBtn(
                                   text: "Rejoindre-SHOP",
                                   onTap: () {
                                     if (formkey.currentState!.validate()) {
                                       print(emailController.text);
                                       print(passwordController.text);
                                       cubit.userRegister(
                                           email: emailController.text,
                                           password: passwordController.text,
                                           phone: phoneController.text,
                                           name: nameController.text
                                       );
                                     }
                                   }),

                               const SizedBox(
                                 height: 20.0,
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text("Vous avez déjà un compte? "),
                                   TextButton(
                                     onPressed: () {
                                       NavigatorToPage(
                                           context: context, Widget: LoginScreens());
                                     },
                                     child: Text("Se connecter "),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           );
         },
         ),
   );
  }
}
