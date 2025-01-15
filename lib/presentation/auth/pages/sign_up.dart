import 'package:flutter/material.dart';
import 'package:todo/common/widgets/buttons/basic_app_button.dart';
import 'package:todo/core/configs/constants/status.dart';
import 'package:todo/presentation/auth/bloc/auth_bloc.dart';
import 'package:todo/presentation/auth/widgets/sign_up/already_account.dart';
import 'package:todo/presentation/auth/widgets/sign_up/email_sign_up.dart';
import 'package:todo/presentation/auth/widgets/sign_up/intro_sign_up.dart';
import 'package:todo/presentation/auth/widgets/sign_up/other_sign_up.dart';
import 'package:todo/presentation/auth/widgets/sign_up/password_sign_up.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = AuthBloc();
  }

  @override
  void dispose() {
    _authBloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _authBloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, bottom: 10),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  const IntroSignUp(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EmailSignUpWidget(controller: emailController,),
                      PasswordSignUpWidget(controller: passwordController,)],
                  ),
                  const SizedBox(height: 20,),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (current,previous)=>current!=previous,
                    builder: (context, state) {
                      return BasicAppButton(title: "Sign up",
                          onPress: () {
                        if (_formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(SignUpWithEmailAndPassword(
                                email: emailController.text.toString(),
                                password: passwordController.text.toString(),
                            context: context));
                        }
                      },
                      loading: state.status==Status.loading? true:false,);
                    },
                  ),
                  const SizedBox(height: 30,),
                  const Text("or sign up with",
                    style: TextStyle(fontSize: 18, color: Colors.grey),),
                  const SizedBox(height: 10,),
                  const OtherSignUp(),
                  const Spacer(),
                  const AlreadyAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
