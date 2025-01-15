import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/auth/bloc/auth_bloc.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({
    required this.title, required this.onPress,
    this.height, this.width,this.loading=false,
    super.key});

  final VoidCallback onPress;
  final String title;
  final double? height;
  final double? width;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 200,
      child: ElevatedButton(onPressed: onPress,
          style: ElevatedButton.styleFrom(
            minimumSize: Size.fromHeight(height ?? 75),
          ),
          child: loading?const CircularProgressIndicator(color: Colors.white,)
              :Text(title, style: const TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20))),
    );
  }
}
