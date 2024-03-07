import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/manager/cubit/login_cubit.dart';
import 'package:carvanta_i/presentation/manager/state/login_state.dart';
import 'package:carvanta_i/presentation/view/screens/switch_car.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Hi, Ahmed !",
                      style: getBoldStyle(color: AppColors.black, fontSize: 20),
                    ),
                    const Spacer(),
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(7)),
                      child: MaterialButton(
                        color: AppColors.lightBlack,
                        onPressed: () {
                          navigateTo(context, const AddCar());
                        },
                        child: Text(
                          "Switch Car",
                          style: getRegularStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
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
                        width: 5,
                      ),
                      SizedBox(
                        width: context.width * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Manufacturer: BMW",
                              style: getRegularStyle(
                                  color: AppColors.black, fontSize: 15),
                            ),
                            SizedBox(
                              height: context.height * 0.01,
                            ),
                            Text(
                              "Car Name: BMW",
                              style: getRegularStyle(
                                  color: AppColors.black, fontSize: 15),
                            ),
                            SizedBox(
                              height: context.height * 0.01,
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
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
