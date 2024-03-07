import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/manager/cubit/login_cubit.dart';
import 'package:carvanta_i/presentation/manager/state/login_state.dart';
import 'package:carvanta_i/presentation/view/widgets/input_field.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        nameController.text = cubit.user!.data.name;
        phoneController.text = cubit.user!.data.phone;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  EneftyIcons.arrow_left_3_outline,
                  color: AppColors.black,
                )),
            title: Text(
              "Profile",
              style: getRegularStyle(color: AppColors.black, fontSize: 23),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: context.height * 0.02),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  defualtFormField(context,
                      controller: nameController,
                      validate: () {},
                      hint: "",
                      type: TextInputType.name,
                      width: double.infinity,
                      suffix: Icon(
                        EneftyIcons.edit_2_outline,
                        color: AppColors.lightGrey,
                      )),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Text(
                    "Phone Number",
                    style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: context.height * 0.02),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  defualtFormField(context,
                      controller: phoneController,
                      validate: () {},
                      hint: "",
                      type: TextInputType.name,
                      width: double.infinity,
                      suffix: Icon(
                        EneftyIcons.edit_2_outline,
                        color: AppColors.lightGrey,
                      )),
                  SizedBox(
                    height: context.height * 0.03,
                  ),
                  Text(
                    "My Car",
                    style: getBoldStyle(
                        color: AppColors.black,
                        fontSize: context.height * 0.02),
                  ),
                  SizedBox(
                    height: context.height * 0.01,
                  ),
                  Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.hardEdge,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: context.height * 0.12,
                              decoration: BoxDecoration(color: AppColors.red),
                              width: 6,
                            ),
                            SizedBox(
                              width: context.width * 0.01,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Manufacturer: BMW",
                                    style: getRegularStyle(
                                        color: AppColors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: context.height * 0.015,
                                  ),
                                  Text(
                                    "Car Name: BMW",
                                    style: getRegularStyle(
                                        color: AppColors.black, fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: context.height * 0.015,
                                  ),
                                  Text(
                                    "Model: 2020",
                                    style: getRegularStyle(
                                        color: AppColors.black, fontSize: 15),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              EneftyIcons.edit_2_outline,
                              color: AppColors.lightGrey,
                            )),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
