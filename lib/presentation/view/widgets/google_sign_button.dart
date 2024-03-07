import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

Widget buildGoogleSign(BuildContext context, VoidCallback fun) => Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: context.width * 0.4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [AppColors.red, AppColors.white])),
            ),
            Text(
              " Or ",
              style: getBoldStyle(color: AppColors.lightBlack, fontSize: 20),
            ),
            Container(
              height: 1,
              width: context.width * 0.4,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [AppColors.red, AppColors.white])),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.03,
        ),
        InkWell(
          onTap: fun,
          child: Container(
            height: context.height * 0.07,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.red)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/G.png"),
                SizedBox(
                  width: context.width * 0.02,
                ),
                Text(
                  "Continue with Google",
                  style: getRegularStyle(color: AppColors.red, fontSize: 15),
                )
              ],
            ),
          ),
        )
      ],
    );
