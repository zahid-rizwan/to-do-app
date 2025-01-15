import 'package:flutter/cupertino.dart';

import '../../../../core/configs/assets/app_images.dart';

class IntroSignUp extends StatelessWidget {
  const IntroSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,width: 120,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(AppImages.logo))
          ),
        ),
        const SizedBox(height: 20),
        const Text("Let's get started!",style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
            color: Color(0xff2a3748)),),

      ],
    );
  }
}
