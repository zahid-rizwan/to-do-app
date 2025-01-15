import 'package:flutter/material.dart';

class PasswordSignIn extends StatelessWidget {
  const PasswordSignIn({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("PASSWORD",style: TextStyle(fontSize: 14,color: Colors.grey),),
              GestureDetector(onTap: (){}, child: const Text("Forget password?",style: TextStyle(fontSize: 14,color: Colors.deepPurple,fontWeight: FontWeight.bold),))
            ],
          ),
          const SizedBox(height: 5,),
          TextFormField(
            controller: controller,
              validator: (value){
                if(value!.isEmpty){
                  return 'Enter Password';
                }
                return null;
              }
          ),],

    );
  }
}
