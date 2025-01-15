import 'package:flutter/material.dart';

import '../../pages/sign_in.dart';

class AlreadyAccount extends StatelessWidget {
  const AlreadyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Already an account?",style: TextStyle(fontSize: 18,color: Colors.grey)),
        TextButton(onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (_)=>SignInPage()));
        }, child: const Text("Log in",style: TextStyle(fontSize: 18),))
      ],);
  }
}
