import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/presentation/view/screens/add_services_screen.dart';
import 'package:carvanta_i/presentation/view/widgets/services_item.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    buildServicesItem(context, index),
                separatorBuilder: (context, index) =>
                    SizedBox(height: context.height * 0.01),
                itemCount: 10),
          )),
        ],
      ),
      floatingActionButton: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
          onPressed: () {
            navigateTo(context, const AddNewServicesScreen());
          },
          backgroundColor: AppColors.red,
          child: Icon(
            EneftyIcons.add_outline,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
