import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:flutter/material.dart';

class LicenceScreen extends StatelessWidget {
  const LicenceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Licences",
            style: getMediumStyle(color: AppColors.black, fontSize: 30),
          )
        ],
      ),
    );
  }
}
