import 'package:flutter/material.dart';
import 'package:todo/data/sources/user_prefrence/user_prefrence.dart';
import 'package:todo/presentation/auth/pages/sign_in.dart';

import '../../../core/configs/colors/app_colors.dart';

class AppbarWidget extends StatelessWidget {
  AppbarWidget({super.key});
  final DateTime currentDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 50,bottom: 10),
        color: AppColors.primary,
      
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Icon(Icons.grid_view_outlined,size: 40,color: Colors.white70,),
              const SizedBox(width: 20,),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 0),
                      prefixIcon: Icon(Icons.search_sharp,color: Colors.grey,)
                  ),
      
                ),
              ),
              const SizedBox(width: 20,),
              Container(
                width: 50,height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff8789ec),
                    shape: BoxShape.circle
                ),
                child:PopupMenuButton(
                  icon: const Icon(Icons.more_horiz_sharp,size: 30,color: Colors.white,),
                    onSelected: (value){
                      if(value=='logout'){
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_)=>SignInPage()));
                         UserPrefrences().removeUser();
                      }
                    },
                    itemBuilder:  (context)=>[
                  const PopupMenuItem(
                    value: 'logout',
                    child: ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Log out'),
                    ),
                  ),
                ])
              )
      
            ],),
            const SizedBox(height: 10,),
            Text(" Today, ${currentDate.day} ${convertMonth(currentDate.month)}",style: TextStyle(color:Colors.white,fontSize: 18),),
            const Text(" My Tasks",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)
          ],
        ),
      ),
    );
  }
  String? convertMonth(int i){
    List<String> month = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    if(i<12){
      return month[i-1];
    }
    else{
      return null;
    }

  }
}
