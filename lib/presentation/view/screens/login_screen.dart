import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/manager/cubit/login_cubit.dart';
import 'package:carvanta_i/presentation/manager/state/login_state.dart';
import 'package:carvanta_i/presentation/view/screens/forget_password.dart';
import 'package:carvanta_i/presentation/view/screens/main_screen.dart';
import 'package:carvanta_i/presentation/view/screens/register_screen.dart';
import 'package:carvanta_i/presentation/view/widgets/google_sign_button.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is GoogleSuccessLoginState || state is LoginSuccessState) {
          navigateTo(context, const MainScreen());
        }
      },
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                  right: context.width * 0.03,
                  left: context.width * 0.03,
                  top: context.height * 0.06),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/car.png")),
                    Text(
                      "Welcome Back!",
                      style: getBoldStyle(color: AppColors.black, fontSize: 25),
                    ),
                    Text(
                      "Enter youer email and password number to login.",
                      style: getLightStyle(
                          color: AppColors.lightBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    defualtFormField(
                      context,
                      width: double.infinity,
                      controller: emailController,
                      validate: (String value) {
                        if (value.contains("@")) {
                          return null;
                        } else {
                          return "The email must contain @";
                        }
                      },
                      hint: "Email",
                      type: TextInputType.emailAddress,
                      suffix: Icon(
                        CupertinoIcons.mail,
                        color: AppColors.lightBlack,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    defualtFormField(context,
                        width: double.infinity,
                        controller: passController, validate: (String value) {
                      if (value.length < 6) {
                        return "The password mustn't be less than 6 digits";
                      }
                      return null;
                    },
                        hint: "Password",
                        type: TextInputType.visiblePassword,
                        suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              isPassword = !isPassword;
                            });
                          },
                          icon: Icon(
                            isPassword
                                ? EneftyIcons.eye_outline
                                : EneftyIcons.eye_slash_outline,
                            color: AppColors.lightBlack,
                          ),
                        ),
                        isPassword: isPassword),
                    Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: () {
                            navigateTo(context, const ForgetPasswordScreen());
                          },
                          child: Text(
                            "Forget your password?",
                            style: getLightStyle(
                                color: AppColors.black, fontSize: 14),
                          ),
                        )),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    mainButton(context, onpressd: () {
                      if (formKey.currentState!.validate()) {
                        cubit.loginUser(
                            email: emailController.text,
                            password: passController.text);
                      }
                    }, background: AppColors.red, text: "Log In"),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account?",
                          style: getLightStyle(
                              color: AppColors.lightBlack, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, const RegisterScreen());
                            },
                            child: Text(
                              " Sign Up",
                              style: getLightStyle(
                                  color: AppColors.red, fontSize: 14),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    buildGoogleSign(context, () async {
                      await cubit.signInWithGoogle();
                    }),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
