import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterFirstView extends StatelessWidget {
  const RegisterFirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(centerTitle: true,automaticallyImplyLeading: false,title: Text("Kayıt ol",style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white)),)
          ,
      body: Center(

        child: Column( mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center, children: [
          button("Kullanıcı kayıt ol",Icons.person),
                    button("Psikolog kayıt ol",Icons.account_circle_rounded)

        ]),


      ),
    );
  }

  OutlinedButton button(String text ,IconData? icon) {
    return OutlinedButton.icon(onPressed: () {
          
        }, icon:Icon(icon,color: Colors.white,),label: Text(text,style: Get.textTheme.bodyMedium!.copyWith(
          color: Colors.white
        ),),style: OutlinedButton.styleFrom(shape: StadiumBorder(side: BorderSide(
          color: Colors.blue,width: 1
        )),),);
  }
}