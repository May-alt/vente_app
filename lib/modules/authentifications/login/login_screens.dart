import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vente_app/layouts/const/constants.dart';
import 'package:vente_app/layouts/navigat_route/nav_route.dart';
import 'package:vente_app/layouts/reus_widgets/reusibalwidgets.dart';
import 'package:vente_app/modules/authentifications/login/cubit_login/login_cubit.dart';
import 'package:vente_app/modules/authentifications/register/register_screens.dart';
import 'package:vente_app/modules/lyouts_screnns/layout_screens.dart';
import 'package:vente_app/shared/cache_helper/cacheHelpere.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({Key? key}) : super(key: key);

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return BlocProvider(
       create: (context) => LoginCubit(),
     child: BlocConsumer<LoginCubit,LoginState>(
       listener: (context, state) {

         if(state is LoginErrorState){
           showTost(msg: state.error, state: TostOptionState.ERROR);
         }
         if(state is LoginSuccessState){
          //Save uid of user si l'utilisatateur est singin
           Cachehelper.saveData(
               key: 'Uid',
               value: state.Uid
           ).then((value) {
             showTost(msg: "Welcom to your Account", state: TostOptionState.SUCCESS);
             NavigatorAndRemove(context: context,Widget: LayoutsScreens());
           });

         }

       },

       builder: (context, state) {

         var cubit = LoginCubit.get(context);

         return Scaffold(
           body: Container(
             height: double.infinity,
             width: double.infinity,
             decoration: BoxDecoration(
               image: DecorationImage(
                   image: AssetImage("assets/images/bg.png"),
                   fit: BoxFit.fill
               ),
             ),

             child: SingleChildScrollView(
               child:  Padding(
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
                               controller: emailController,
                               label: Text("E-mail ou nom d'utilisateur"),
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
                               controller: passwordController,
                               label: Text("Mot de passe"),
                               prefixIcon: Icon(Icons.lock),
                               keyboardType: TextInputType.visiblePassword,
                               obscureText: cubit.isPassword,
                               suffix: cubit.suffix,
                               iconsColor: Colors.grey,
                               onPressedSufix: (){
                                 cubit.changeVisibilitePassword();
                               },
                               validator: (val) {
                                 if (val == null || val.isEmpty) {
                                   return "your password is empty";
                                 }
                               }),

                           // Align(
                           //   alignment: AlignmentDirectional.topEnd,
                           //   child: TextButton(onPressed: (){}, child: Text("Forget password?")),
                           // ),
                           const SizedBox(
                               height: 10.0
                           ),

                           ReusBtn(
                               text: "Se connecter",
                               onTap: () {
                                 if (formkey.currentState!.validate()) {
                                   print(emailController.text);
                                   print(passwordController.text);
                                   cubit.userLogin(
                                       email: emailController.text,
                                       password: passwordController.text
                                   );

                                 }
                               }),

                           const SizedBox(
                             height: 20.0,
                           ),

                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text("Vous n'avez pas de compte? "),
                               TextButton(
                                 onPressed: () {
                                   NavigatorToPage(
                                       context: context, Widget: RegisterScreens());
                                 },
                                 child: Text("Inscrivez-vous "),
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
         );
       },
     ),
   );
  }
}
