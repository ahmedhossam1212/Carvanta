import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class RefuelScreen extends StatefulWidget {
  const RefuelScreen({super.key});

  @override
  State<RefuelScreen> createState() => _RefuelScreenState();
}

class _RefuelScreenState extends State<RefuelScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController odometerController = TextEditingController();
  TextEditingController litersController = TextEditingController();
  TextEditingController pricePerLiterController = TextEditingController();
  TextEditingController totalCostController = TextEditingController();
  TextEditingController efficiencyController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    dateController.dispose();
    odometerController.dispose();
    litersController.dispose();
    pricePerLiterController.dispose();
    totalCostController.dispose();
    efficiencyController.dispose();
    notesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
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
                type: TextInputType.name,
                width: double.infinity,
                suffix: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      EneftyIcons.calendar_outline,
                      color: AppColors.lightGrey,
                    ))),
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
              type: TextInputType.name,
              width: double.infinity,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Liters",
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
                        controller: litersController,
                        validate: () {},
                        hint: "",
                        type: TextInputType.number,
                        width: context.width * 0.43)
                  ],
                ),
                SizedBox(
                  width: context.width * 0.035,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Price per liter",
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
                        controller: pricePerLiterController,
                        validate: () {},
                        hint: "",
                        type: TextInputType.number,
                        width: context.width * 0.43)
                  ],
                )
              ],
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Total price",
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
              controller: totalCostController,
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
                  "Efficiency",
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
                controller: efficiencyController,
                validate: () {},
                hint: "",
                type: TextInputType.name,
                width: double.infinity,
                suffix: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Km/Liter",
                    style: getMediumStyle(
                        color: AppColors.lightGrey, fontSize: 15),
                  ),
                )),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Notes",
                  style: getLightStyle(
                    color: AppColors.black,
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
              height: context.height * 0.05,
            ),
            mainButton(context,
                onpressd: () {}, background: AppColors.red, text: "Save")
          ],
        ),
      ),
    );
  }
}
