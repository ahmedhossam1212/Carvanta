import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

Widget buildCaritem(BuildContext context) => Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.grey, borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Container(
            height: context.height * 0.12,
            decoration: BoxDecoration(color: AppColors.red),
            width: 5,
          ),
          SizedBox(
            width: context.width * 0.01,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Manufacturer: BMW",
                  style: getRegularStyle(color: AppColors.black, fontSize: 15),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Text(
                  "Car Name: BMW",
                  style: getRegularStyle(color: AppColors.black, fontSize: 15),
                ),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Text(
                  "Model: 2020",
                  style: getRegularStyle(color: AppColors.black, fontSize: 15),
                )
              ],
            ),
          )
        ],
      ),
    );
