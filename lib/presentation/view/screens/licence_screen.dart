import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:carvanta_i/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class LicenceScreen extends StatefulWidget {
  const LicenceScreen({super.key});

  @override
  State<LicenceScreen> createState() => _LicenceScreenState();
}

class _LicenceScreenState extends State<LicenceScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController platNumController = TextEditingController();
  final TextEditingController plateLetterController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
  final TextEditingController issueController = TextEditingController();
  final TextEditingController expiryController = TextEditingController();
  bool checkBox = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Licence holder name",
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
                controller: nameController,
                validate: () {},
                hint: "",
                type: TextInputType.name,
                width: double.infinity),
            SizedBox(
              height: context.height * 0.02,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Plate number",
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
                  controller: plateLetterController,
                  validate: () {},
                  hint: "Ex : 52354 & 5 5 6 5 د ق م",
                  type: TextInputType.text,
                  width: double.infinity,
                ),
              ],
            ),
            SizedBox(
              width: context.height * 0.01,
            ),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              children: [
                Text(
                  "Nationality",
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
                controller: nationalityController,
                validate: () {},
                hint: "",
                type: TextInputType.text,
                width: double.infinity),
            SizedBox(
              height: context.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Date of issue",
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
                        controller: issueController,
                        validate: () {},
                        hint: "",
                        type: TextInputType.number,
                        width: context.width * 0.43,
                        suffix: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              EneftyIcons.calendar_outline,
                              color: AppColors.lightGrey,
                            ))),
                  ],
                ),
                SizedBox(
                  width: context.height * 0.025,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Date of expiry",
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
                        controller: platNumController,
                        validate: () {},
                        hint: "",
                        type: TextInputType.number,
                        width: context.width * 0.43,
                        suffix: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              EneftyIcons.calendar_outline,
                              color: AppColors.lightGrey,
                            ))),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.03,
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
                  value: checkBox,
                  onChanged: (value) {
                    setState(() {
                      checkBox = value!;
                    });
                  },
                ),
                SizedBox(
                  width: context.width * 0.01,
                ),
                SizedBox(
                  width: context.width * 0.65,
                  child: Text(
                    "Set a reminder to send you a notification before the expiry date",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style:
                        getRegularStyle(color: AppColors.black, fontSize: 15),
                  ),
                )
              ],
            ),
            SizedBox(
              height: context.height * 0.02,
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
                  "Add a picture of the licene ",
                  style: getRegularStyle(
                      color: AppColors.black, fontSize: context.height * 0.017),
                ),
                Text(
                  "(optional)",
                  style: getRegularStyle(
                      color: AppColors.lightGrey,
                      fontSize: context.height * 0.017),
                ),
              ],
            ),
            SizedBox(
              height: context.height * 0.15,
            ),
            mainButton(context,
                onpressd: () {}, background: AppColors.red, text: "Save")
          ],
        ),
      ),
    );
  }
}
