import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../common/widgets/buttons/circular_button.dart';

class OtherSignIn extends StatelessWidget {
  const OtherSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CircularButton(icon: FontAwesomeIcons.facebookF, onPress: (){}, bgColor: const Color(0xff39549d)),
        CircularButton(icon: FontAwesomeIcons.google, onPress: (){}, bgColor: const Color(0xffe24637)),
        CircularButton(icon: FontAwesomeIcons.apple, onPress: (){}, bgColor:Colors.black)
      ],);
  }
}
