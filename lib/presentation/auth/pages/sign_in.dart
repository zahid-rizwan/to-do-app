import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo/presentation/auth/widgets/sign_in/dont_have_account.dart';
import 'package:todo/presentation/auth/widgets/sign_in/email_sign_in.dart';
import 'package:todo/presentation/auth/widgets/sign_in/intro_sign_in.dart';
import 'package:todo/presentation/auth/widgets/sign_in/other_sign_in.dart';
import 'package:todo/presentation/auth/widgets/sign_in/password_sign_in.dart';

import '../../../common/widgets/buttons/basic_app_button.dart';
import '../../../core/configs/constants/status.dart';
import '../bloc/auth_bloc.dart';


class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  const IntroSignIn(),

                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EmailSignIn(controller: emailController,),
                        PasswordSignIn(controller: passwordController)
                      ]),
                  const SizedBox(height: 20,),
                  BlocBuilder<AuthBloc, AuthState>(
                    buildWhen: (current,previous)=>current!=previous,
                    builder: (context, state) {
                      return BasicAppButton(title: "Log in", onPress: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(SignInWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                          context: context));
                        }
                      },
                        loading: state.status == Status.loading
                            ? true
                            : false,);
                    },
                  ),
                  const SizedBox(height: 30,),
                  const Text("or log in with",
                    style: TextStyle(fontSize: 18, color: Colors.grey),),
                  const SizedBox(height: 10,),
                  const OtherSignIn(),
                  const Spacer(),
                  const DontHaveAccount()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
