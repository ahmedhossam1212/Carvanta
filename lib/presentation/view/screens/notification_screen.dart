import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/notification_item.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.lightBlack),
        backgroundColor: AppColors.lightBlack,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: getBoldStyle(color: AppColors.white, fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              EneftyIcons.arrow_left_3_outline,
              color: AppColors.white,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: ListView.separated(
                  itemBuilder: (context, index) =>
                      buildNotifiactionItem(context),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.height * 0.01),
                  itemCount: 3),
            ),
          )
        ],
      ),
    );
  }
}
