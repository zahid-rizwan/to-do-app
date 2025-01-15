import 'package:flutter/material.dart';
import 'package:todo/core/configs/assets/app_images.dart';
import 'package:todo/data/sources/user_prefrence/user_prefrence.dart';
import 'package:todo/presentation/auth/pages/sign_in.dart';
import 'package:todo/presentation/auth/pages/sign_up.dart';
import 'package:todo/presentation/home/pages/home.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     body: Stack(
       children: [
         Align(alignment: Alignment.bottomRight,
             child:Container(
               padding: const EdgeInsets.only(bottom: 20,right: 20),
               width: 180,
               height: 180,
               decoration: const BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage(AppImages.getStartedBg),
                   fit: BoxFit.cover,
                 ),
               ),
               child: Align(
                 alignment: Alignment.bottomRight,
                 child: IconButton(
                   onPressed: () {
                     navigateToNextScreen(context);
                   },
                   icon: const Icon(
                     Icons.arrow_forward_sharp,
                     size: 70,
                     color: Colors.white,

                   ),
                 ),
               ),
             ),

             ),
         Padding(
           padding: const EdgeInsets.only(left: 50,bottom: 50),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Container(
                 height: 150,width: 150,
                 decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                   image: const DecorationImage(
                     fit: BoxFit.cover,
                       image: AssetImage(AppImages.logo))
                 ),
               ),
               const Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   SizedBox(height: 30,),
                   Text("Get things done",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color:  Color(0xff2a3748)),),
                   SizedBox(height: 5,),
                   Text("Just a click away from\nplanning your tasks",style: TextStyle(fontSize: 18,color: Colors.grey),),
                   Icon(Icons.more_horiz_sharp,size: 60,color: Colors.grey,),
                 ],
               )

             ],
           ),
         )
       ],
     ),
    );
  }

  void navigateToNextScreen(BuildContext context)async{
    bool? islogin=await UserPrefrences().getLoginKey();
    if(islogin==true){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_)=>HomePage()));
    }
    else{
      Navigator.push(context,
          MaterialPageRoute(builder: (_)=> SignInPage()));
    }
  }
}
