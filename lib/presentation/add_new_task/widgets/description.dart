
import 'package:flutter/material.dart';

class DescriptionWidget extends StatelessWidget {
  DescriptionWidget({super.key, required this.controller});
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(" Description",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
        const SizedBox(height: 5,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(25)
         ),
          child: TextFormField(
          controller: controller,
            maxLines: 6 ,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Enter description';
              }

              return null;
            },
          ),
        ),
      ],
    );
  }
}
