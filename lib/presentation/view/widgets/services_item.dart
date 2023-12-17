import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/media_query_values.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

Widget buildServicesItem(BuildContext context, index) => Container(
      width: double.infinity,
      height: context.height * 0.12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.grey),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.white,
                child: Icon(
                  EneftyIcons.setting_2_bold,
                  color: AppColors.red,
                )),
            SizedBox(
              width: context.width * 0.03,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Battery",
                  style: getMediumStyle(color: AppColors.black, fontSize: 17),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      "Next Service:29/3/2023",
                      style: getMediumStyle(
                        color: AppColors.red,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.1,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            "View Details",
                            style: getMediumStyle(
                              color: AppColors.red,
                            ),
                          ),
                          Icon(
                            EneftyIcons.arrow_right_3_outline,
                            color: AppColors.red,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
