import 'package:carvanta/config/routes/app_routs.dart';
import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/media_query_values.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:carvanta/presentation/view/screens/add_services_screen.dart';
import 'package:carvanta/presentation/view/widgets/services_item.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView.separated(
              itemBuilder: (context, index) =>
                  buildServicesItem(context, index),
              separatorBuilder: (context, index) =>
                  SizedBox(height: context.height * 0.01),
              itemCount: 3),
        )),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            width: context.width * 0.45,
            height: context.height * 0.07,
            decoration: BoxDecoration(
                color: AppColors.red,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  navigateTo(context, const AddNewServicesScreen());
                },
                child: Row(
                  children: [
                    Icon(
                      EneftyIcons.add_outline,
                      color: AppColors.white,
                    ),
                    Text(
                      "Add new item",
                      style:
                          getMediumStyle(color: AppColors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
