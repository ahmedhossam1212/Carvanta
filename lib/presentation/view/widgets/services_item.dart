import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/style_manager.dart';

Widget buildServicesItem(BuildContext context, index) => Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.grey),
      child: Padding(
        padding: EdgeInsets.only(
            left: context.width * 0.02,
            top: context.height * 0.01,
            bottom: context.height * 0.01),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Next Service:29/3/2023",
                        style:
                            getMediumStyle(color: AppColors.red, fontSize: 10),
                      ),
                      SizedBox(width: context.width * 0.2),
                      TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "View Details",
                              style: getMediumStyle(
                                  color: AppColors.red, fontSize: 11),
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
      ),
    );
