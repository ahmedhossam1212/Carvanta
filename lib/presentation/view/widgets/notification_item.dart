import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

Widget buildNotifiactionItem(BuildContext context) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.grey),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.white,
                child: Icon(
                  EneftyIcons.notification_bing_bold,
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
                SizedBox(
                  width: context.width * 0.5,
                  child: Text(
                    "Your next changable date for your battery is close!",
                    style: getMediumStyle(
                      color: AppColors.lightGrey,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Text(
                  "Service date::29/3/2023",
                  style: getMediumStyle(
                    color: AppColors.red,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
