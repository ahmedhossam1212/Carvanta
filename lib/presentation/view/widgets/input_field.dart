import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:flutter/material.dart';
import 'package:carvanta/core/utils/media_query_values.dart';

Widget defualtFormField(
  BuildContext context, {
  required TextEditingController controller,
  required Function validate,
  required String hint,
  required TextInputType type,
  bool isPassword = false,
  Widget? suffix,
}) =>
    Container(
      width: double.infinity,
      height: context.height * 0.08,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: TextFormField(
            obscureText: isPassword,
            keyboardType: type,
            controller: controller,
            validator: (String? s) {
              return validate(s);
            },
            cursorColor: AppColors.lightBlack,
            style: getMediumStyle(color: AppColors.lightBlack, fontSize: 17),
            decoration: InputDecoration(
                hintStyle:
                    getMediumStyle(color: AppColors.lightBlack, fontSize: 17),
                hintText: hint,
                suffixIcon: suffix,
                border: InputBorder.none),
          ),
        ),
      ),
    );
