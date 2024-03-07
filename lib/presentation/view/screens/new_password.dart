import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPassword = true;
  bool isPasswordConfirm = true;

  @override
  Widget build(BuildContext context) {
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
            )),
        title: Text(
          "Create new password",
          style: getRegularStyle(color: AppColors.black, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            right: context.width * 0.03,
            left: context.width * 0.03,
            top: context.height * 0.03,
            bottom: context.height * 0.02,
          ),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/images/circleBack.svg",
                        height: context.height * 0.4,
                      ),
                      Positioned(
                        right: context.width * 0.19,
                        top: context.height * 0.085,
                        child: SvgPicture.asset(
                          "assets/images/lockTrue.svg",
                          height: context.height * 0.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Text(
                    "Your new password must be different from your previous password",
                    textAlign: TextAlign.center,
                    style:
                        getRegularStyle(color: AppColors.black, fontSize: 17),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  defualtFormField(context,
                      controller: passwordController,
                      validate: () {},
                      hint: "New password",
                      type: TextInputType.text,
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
                      isPassword: isPassword,
                      width: double.infinity),
                  SizedBox(
                    height: context.height * 0.02,
                  ),
                  defualtFormField(context,
                      controller: confirmPasswordController,
                      validate: () {},
                      hint: "Confirm password",
                      type: TextInputType.text,
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordConfirm = !isPasswordConfirm;
                          });
                        },
                        icon: Icon(
                          isPasswordConfirm
                              ? EneftyIcons.eye_outline
                              : EneftyIcons.eye_slash_outline,
                          color: AppColors.lightBlack,
                        ),
                      ),
                      isPassword: isPasswordConfirm,
                      width: double.infinity),
                  SizedBox(
                    height: context.height * 0.07,
                  ),
                  mainButton(context,
                      onpressd: () {},
                      background: AppColors.red,
                      text: "Change Password")
                ]),
          ),
        ),
      ),
    );
  }
}
