import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/manager/cubit/auth_cubit.dart';
import 'package:carvanta_i/presentation/manager/state/auth_state.dart';
import 'package:carvanta_i/presentation/view/screens/login_screen.dart';
import 'package:carvanta_i/presentation/view/screens/main_screen.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          navigateAndFinish(context, const MainScreen());
        } else if (state is RegisterErrState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
            "email and phone number must be unique",
            style: getMediumStyle(color: AppColors.white, fontSize: 15),
          )));
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
              backgroundColor: AppColors.white,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  EneftyIcons.arrow_left_3_outline,
                  color: AppColors.black,
                ),
              )),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(
                right: context.width * 0.03,
                left: context.width * 0.03,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Let’s Get Started!",
                      style: getBoldStyle(color: AppColors.black, fontSize: 25),
                    ),
                    Text(
                      "Create an account in a few minutes.",
                      style: getLightStyle(
                          color: AppColors.lightBlack, fontSize: 14),
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    defualtFormField(
                      context,
                      width: double.infinity,
                      controller: nameController,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return "please enter your name";
                        }
                      },
                      hint: "Full name",
                      type: TextInputType.name,
                      suffix: Icon(
                        EneftyIcons.user_outline,
                        color: AppColors.lightBlack,
                      ),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    defualtFormField(
                      width: double.infinity,
                      context,
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
                    defualtFormField(
                      context,
                      width: double.infinity,
                      controller: phoneController,
                      validate: (String value) {
                        if (value.length < 11 || value.length > 11) {
                          return "phone number must be 11 digits";
                        }
                      },
                      hint: "phone",
                      type: TextInputType.phone,
                      suffix: Icon(
                        EneftyIcons.call_outline,
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
                    SizedBox(
                      height: context.height * 0.03,
                    ),
                    mainButton(context, onpressd: () {
                      if (formKey.currentState!.validate()) {
                        cubit.createUser(
                            email: emailController.text,
                            name: nameController.text,
                            password: passController.text,
                            phone: phoneController.text);
                      }
                    }, background: AppColors.red, text: "Create account"),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: getLightStyle(
                              color: AppColors.lightBlack, fontSize: 14),
                        ),
                        TextButton(
                            onPressed: () {
                              navigateAndFinish(context, const LoginScreen());
                            },
                            child: Text(
                              " Sign In",
                              style: getLightStyle(
                                  color: AppColors.red, fontSize: 14),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: context.height * 0.03,
                    ),
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
