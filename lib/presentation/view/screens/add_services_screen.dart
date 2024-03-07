import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNewServicesScreen extends StatefulWidget {
  const AddNewServicesScreen({super.key});

  @override
  State<AddNewServicesScreen> createState() => _AddNewServicesScreenState();
}

class _AddNewServicesScreenState extends State<AddNewServicesScreen> {
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController sellerShopController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  bool changable = false;
  bool notifyMe = false;
  List<String> servicesName = [
    "Air Conditioning",
    "Air Filter",
    "Battery",
    "Belts",
    "Brake Fluid",
    "Brake Pad",
    "Car Wash",
    "Fuel Filter",
    "Inspection",
    "Labor Cost",
    "Masa7at",
    "New Tires",
    "Oil Change",
    "Oil Filter",
    "Rotate Tires",
    "Suspension System",
    "Tire Pressure",
    "Wheel Alignment",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.lightBlack),
        backgroundColor: AppColors.lightBlack,
        centerTitle: true,
        title: Text(
          "Add New Services",
          style: getMediumStyle(color: AppColors.white, fontSize: 20),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Service name",
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
                controller: serviceNameController,
                validate: () {},
                hint: "",
                type: TextInputType.text,
                width: double.infinity,
                suffix: DropdownButton<String>(
                  menuMaxHeight: context.height * 0.3,
                  borderRadius: BorderRadius.circular(15),
                  elevation: 5,
                  icon: Icon(
                    EneftyIcons.arrow_down_outline,
                    color: AppColors.red,
                  ),
                  items: servicesName
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.black),
                            ),
                          ))
                      .toList(),
                  onChanged: (item) => setState(() {
                    serviceNameController.text = item!;
                  }),
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "Date",
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
              defualtFormField(context,
                  controller: dateController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity,
                  suffix: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        EneftyIcons.calendar_outline,
                        color: AppColors.lightGrey,
                      ))),
              SizedBox(
                height: context.height * 0.01,
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
              defualtFormField(context,
                  controller: odometerController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity),
              SizedBox(
                height: context.height * 0.01,
              ),
              Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return AppColors.grey;
                      }
                      return AppColors.grey;
                    }),
                    side: BorderSide(color: AppColors.grey),
                    checkColor: AppColors.red,
                    value: changable,
                    onChanged: (value) {
                      setState(() {
                        changable = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: context.width * 0.01,
                  ),
                  SizedBox(
                    width: context.width * 0.65,
                    child: Text(
                      "Is this item changable ?",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          getRegularStyle(color: AppColors.black, fontSize: 15),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.disabled)) {
                        return AppColors.grey;
                      }
                      return AppColors.grey;
                    }),
                    side: BorderSide(color: AppColors.grey),
                    checkColor: AppColors.red,
                    value: notifyMe,
                    onChanged: (value) {
                      setState(() {
                        notifyMe = value!;
                      });
                    },
                  ),
                  SizedBox(
                    width: context.width * 0.01,
                  ),
                  SizedBox(
                    width: context.width * 0.65,
                    child: Row(
                      children: [
                        Text(
                          "Notify me ? ",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: getRegularStyle(
                              color: AppColors.black, fontSize: 15),
                        ),
                        const Icon(CupertinoIcons.question_circle)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        EneftyIcons.add_bold,
                        size: 30,
                      )),
                  Text(
                    "Attach bill",
                    style:
                        getRegularStyle(color: AppColors.black, fontSize: 15),
                  ),
                  Text(
                    "(optional)",
                    style: getRegularStyle(
                        color: AppColors.lightGrey, fontSize: 15),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    "Location ",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "(optional)",
                    style: getLightStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(context,
                  controller: locationController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity),
              SizedBox(
                height: context.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "Seller shop ",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "(optional)",
                    style: getLightStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              defualtFormField(context,
                  controller: locationController,
                  validate: () {},
                  hint: "",
                  type: TextInputType.text,
                  width: double.infinity),
              SizedBox(
                height: context.height * 0.01,
              ),
              Row(
                children: [
                  Text(
                    "Note ",
                    style: getLightStyle(
                      color: AppColors.black,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "(optional)",
                    style: getLightStyle(
                      color: AppColors.lightGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                height: context.height * 0.2,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: TextField(
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.text,
                  controller: notesController,
                  cursorColor: AppColors.lightBlack,
                  style:
                      getMediumStyle(color: AppColors.lightBlack, fontSize: 17),
                  decoration: InputDecoration(
                      hintStyle: getMediumStyle(
                          color: AppColors.lightBlack, fontSize: 17),
                      hintText: "",
                      filled: true,
                      fillColor: AppColors.grey,
                      errorBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      border: const OutlineInputBorder()),
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "See previous car history",
                        style: getRegularStyle(
                            color: AppColors.black, fontSize: 15),
                      ),
                      Icon(
                        EneftyIcons.arrow_right_4_outline,
                        color: AppColors.black,
                        size: 15,
                      )
                    ],
                  )),
              SizedBox(
                height: context.height * 0.05,
              ),
              mainButton(context,
                  onpressd: () {}, background: AppColors.red, text: "Save")
            ],
          ),
        ),
      ),
    );
  }
}
