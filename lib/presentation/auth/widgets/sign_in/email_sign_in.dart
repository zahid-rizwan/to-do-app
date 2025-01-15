import 'package:flutter/material.dart';

class EmailSignIn extends StatelessWidget {
   EmailSignIn({super.key,required this.controller});
final TextEditingController controller;
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("EMAIL ADDRESS",style: TextStyle(fontSize: 14,color: Colors.grey),),
        const SizedBox(height: 5,),
        TextFormField(
          controller: controller,
          validator: (value){
            if(value!.isEmpty){
              return 'Enter Email';
            }
            else if(!emailRegex.hasMatch(value)) {
              return "Enter valid Email";
            }
            return null;
          },
        ),
        const SizedBox(height: 10,),
      ],
    );
  }
}
