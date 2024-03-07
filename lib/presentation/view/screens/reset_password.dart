import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/screens/new_password.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:carvanta_i/presentation/view/widgets/otp_field.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController digt0Controller = TextEditingController();
  TextEditingController digt1Controller = TextEditingController();
  TextEditingController digt2Controller = TextEditingController();
  TextEditingController digt3Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              EneftyIcons.arrow_left_3_outline,
              color: AppColors.black,
            )),
        title: Text(
          "Reset password",
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
                          "assets/images/lock.svg",
                          height: context.height * 0.2,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Text(
                    "Please enter the 4 digit number to reset your password",
                    textAlign: TextAlign.center,
                    style:
                        getRegularStyle(color: AppColors.black, fontSize: 17),
                  ),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: otpForm(
                          context,
                          controller: digt0Controller,
                          validate: () {},
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.07,
                      ),
                      Expanded(
                        child: otpForm(
                          context,
                          controller: digt1Controller,
                          validate: () {},
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.07,
                      ),
                      Expanded(
                        child: otpForm(
                          context,
                          controller: digt2Controller,
                          validate: () {},
                        ),
                      ),
                      SizedBox(
                        width: context.width * 0.07,
                      ),
                      Expanded(
                        child: otpForm(
                          context,
                          controller: digt3Controller,
                          validate: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: context.height * 0.15),
                  mainButton(context, onpressd: () {
                    navigateTo(context, const NewPasswordScreen());
                  }, background: AppColors.red, text: "Reset Password")
                ]),
          ),
        ),
      ),
    );
  }
}
