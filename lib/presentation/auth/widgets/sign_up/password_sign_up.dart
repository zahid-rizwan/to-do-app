import 'package:flutter/material.dart';

class PasswordSignUpWidget extends StatelessWidget {
  const PasswordSignUpWidget({super.key,required this.controller});
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("PASSWORD",style: TextStyle(fontSize: 14,color: Colors.grey),),
        const SizedBox(height: 5,),
        TextFormField(
          controller: controller,
            validator: (value){
              if(value!.isEmpty){
                return 'Enter Password';
              }
              return null;
            }
        )
      ]
    );
  }
}
