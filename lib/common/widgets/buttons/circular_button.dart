
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    required this.icon,required this.onPress,
    required this.bgColor,
    super.key});
  final VoidCallback onPress;
  final IconData icon;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: bgColor,
          shape: BoxShape.circle
        ),
        child: Center(child: FaIcon(icon,color: Colors.white,size: 30,))
      ),
    );
  }
}
