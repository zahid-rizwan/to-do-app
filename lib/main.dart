import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo/presentation/add_new_task/bloc/add_task_bloc.dart';
import 'package:todo/presentation/get_started/pages/get_started.dart';
import 'package:todo/presentation/home/bloc/home_bloc.dart';
import 'package:todo/service_locator.dart';

import 'core/configs/theme/app_theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AddTaskBloc(),
        ),
        BlocProvider(
          create: (_) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'ToDo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const GetStartedPage(),
      ),
    );
  }
}


