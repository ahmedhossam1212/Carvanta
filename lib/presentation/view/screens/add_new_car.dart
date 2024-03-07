import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewCar extends StatefulWidget {
  const AddNewCar({super.key});

  @override
  State<AddNewCar> createState() => _AddNewCarState();
}

class _AddNewCarState extends State<AddNewCar> {
  TextEditingController manufacturerController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController ccController = TextEditingController();
  TextEditingController feulController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    manufacturerController.dispose();
    modelController.dispose();
    nameController.dispose();
    odometerController.dispose();
    ccController.dispose();
    feulController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.lightBlack),
        backgroundColor: AppColors.white,
        centerTitle: true,
        title: Text(
          "Car Details",
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Manufacturer",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "*",
                    style: getLightStyle(
                      color: AppColors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(
                context,
                controller: manufacturerController,
                validate: () {},
                hint: "",
                type: TextInputType.name,
                width: double.infinity,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Model",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "*",
                    style: getLightStyle(
                      color: AppColors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(
                context,
                controller: modelController,
                validate: () {},
                hint: "",
                type: TextInputType.number,
                width: double.infinity,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Car Name",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "*",
                    style: getLightStyle(
                      color: AppColors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(
                context,
                controller: nameController,
                validate: () {},
                hint: "",
                type: TextInputType.name,
                width: double.infinity,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Odometer",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "*",
                    style: getLightStyle(
                      color: AppColors.red,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(
                context,
                controller: odometerController,
                validate: () {},
                hint: "",
                type: TextInputType.number,
                width: double.infinity,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "CC ",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "(Optinal)",
                    style: getLightStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(
                context,
                controller: ccController,
                validate: () {},
                hint: "",
                type: TextInputType.number,
                width: double.infinity,
              ),
              SizedBox(
                height: context.height * 0.02,
              ),
              Row(
                children: [
                  Text(
                    "Fuel Capacity ",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "(Optinal)",
                    style: getLightStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(
                context,
                controller: feulController,
                validate: () {},
                hint: "",
                type: TextInputType.number,
                width: double.infinity,
              ),
              SizedBox(
                height: context.height * 0.1,
              ),
              mainButton(context,
                  onpressd: () {}, background: AppColors.red, text: "Done")
            ],
          ),
        ),
      ),
    );
  }
}
