
import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

class AppTheme{
  static final lightTheme=ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xfff5f7fe),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                  color: Colors.grey,
                  width: 1
              )
          ),
          enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: const BorderSide(
                color: Colors.grey,
              )
          )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35)
              ))
      ));


}