import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Change Password",
          style: getRegularStyle(color: AppColors.black, fontSize: 23),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Old Password",
                style: getRegularStyle(
                    color: AppColors.black, fontSize: context.height * 0.025),
              ),
              defualtFormField(context,
                  controller: oldPassController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity),
              SizedBox(
                height: context.height * 0.01,
              ),
              Text(
                "New Password",
                style: getRegularStyle(
                    color: AppColors.black, fontSize: context.height * 0.025),
              ),
              defualtFormField(context,
                  controller: newPassController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity),
              SizedBox(
                height: context.height * 0.01,
              ),
              Text(
                "Confirm New Password",
                style: getRegularStyle(
                    color: AppColors.black, fontSize: context.height * 0.025),
              ),
              defualtFormField(context,
                  controller: confirmPassController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity),
              SizedBox(
                height: context.height * 0.2,
              ),
              mainButton(context,
                  onpressd: () {}, background: AppColors.red, text: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
