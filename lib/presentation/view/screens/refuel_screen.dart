import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class RefuelScreen extends StatelessWidget {
  const RefuelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Refueling",
            style: getMediumStyle(color: AppColors.black, fontSize: 30),
          )
        ],
      ),
    );
  }
}
