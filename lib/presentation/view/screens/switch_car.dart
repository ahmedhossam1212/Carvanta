import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/screens/add_new_car.dart';
import 'package:carvanta_i/presentation/view/widgets/car_data.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddCar extends StatelessWidget {
  const AddCar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.lightBlack),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Choose your car",
          style: getMediumStyle(color: AppColors.black, fontSize: 20),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              EneftyIcons.arrow_left_3_outline,
              color: AppColors.black,
            )),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView.separated(
                    itemBuilder: (context, index) => buildCaritem(context),
                    separatorBuilder: (context, index) =>
                        SizedBox(height: context.height * 0.03),
                    itemCount: 20),
              )),
            ],
          ),
          Align(
            alignment: const Alignment(1, 0.9),
            child: Container(
              width: context.width * 0.45,
              height: context.height * 0.08,
              decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {
                    navigateTo(context, const AddNewCar());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        EneftyIcons.add_outline,
                        color: AppColors.white,
                      ),
                      Text(
                        "Add new car",
                        style: getMediumStyle(
                            color: AppColors.white,
                            fontSize: context.height * 0.019),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
