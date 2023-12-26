import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/media_query_values.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Hi, Mohamed!",
                style: getBoldStyle(color: AppColors.black, fontSize: 20),
              ),
              const Spacer(),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12)),
                child: MaterialButton(
                  color: AppColors.lightBlack,
                  onPressed: () {},
                  child: Text(
                    "Switch Car",
                    style: getRegularStyle(color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.height * 0.02,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.grey, borderRadius: BorderRadius.circular(15)),
            child: Row(
              children: [
                Container(
                  height: context.height * 0.18,
                  decoration: BoxDecoration(color: AppColors.red),
                  width: 5,
                ),
                SizedBox(
                  width: context.width * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        "data : Data",
                        style: getRegularStyle(
                            color: AppColors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      Text(
                        "data : Data",
                        style: getRegularStyle(
                            color: AppColors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: context.height * 0.01,
                      ),
                      Text(
                        "data : Data",
                        style: getRegularStyle(
                            color: AppColors.black, fontSize: 15),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
