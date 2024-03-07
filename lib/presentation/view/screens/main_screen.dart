import 'package:carvanta_i/config/routes/app_routs.dart';
import 'package:carvanta_i/core/utils/app_colors.dart';
import 'package:carvanta_i/core/utils/media_query_values.dart';
import 'package:carvanta_i/core/utils/style_manager.dart';
import 'package:carvanta_i/presentation/manager/cubit/login_cubit.dart';
import 'package:carvanta_i/presentation/view/screens/change_password_screen.dart';
import 'package:carvanta_i/presentation/view/screens/home_screen.dart';
import 'package:carvanta_i/presentation/view/screens/licence_screen.dart';
import 'package:carvanta_i/presentation/view/screens/login_screen.dart';
import 'package:carvanta_i/presentation/view/screens/notification_screen.dart';
import 'package:carvanta_i/presentation/view/screens/profile_screen.dart';
import 'package:carvanta_i/presentation/view/screens/refuel_screen.dart';
import 'package:carvanta_i/presentation/view/screens/services_screen.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int curentIndex = 0;
  int selectedIndex = 0;

  List<String> appBarTitle = [
    "Carvanta",
    "Licence",
    "Refueling",
    "Services",
  ];
  List<Widget> screens = [
    const HomeScreen(),
    const LicenceScreen(),
    const RefuelScreen(),
    const ServicesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: AppColors.white,
            )),
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: AppColors.lightBlack),
        centerTitle: true,
        backgroundColor: AppColors.lightBlack,
        title: Text(
          appBarTitle[curentIndex],
          style: getBoldStyle(color: AppColors.white, fontSize: 20),
        ),
        actions: [
          IconButton(
              onPressed: () {
                navigateTo(context, const NotificationScreen());
              },
              icon: Icon(
                EneftyIcons.notification_outline,
                color: AppColors.white,
              ))
        ],
      ),
      body: screens[curentIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.red,
          unselectedItemColor: AppColors.lightBlack,
          type: BottomNavigationBarType.fixed,
          currentIndex: curentIndex,
          onTap: (value) {
            setState(() {
              curentIndex = value;
            });
          },
          elevation: 50,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(EneftyIcons.home_2_outline), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(EneftyIcons.personalcard_outline),
                label: "Licences"),
            BottomNavigationBarItem(
                icon: Icon(EneftyIcons.gas_station_outline),
                label: "Refueling"),
            BottomNavigationBarItem(
                icon: Icon(EneftyIcons.setting_2_outline), label: "Services"),
          ]),
      drawer: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            Container(
              height: context.height * 0.8,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
              child: Drawer(
                width: context.width * 0.9,
                clipBehavior: Clip.hardEdge,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                            onPressed: () {
                              navigateTo(context, const ProfileScreen());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  EneftyIcons.user_outline,
                                  color: AppColors.lightBlack,
                                ),
                                SizedBox(
                                  width: context.width * 0.03,
                                ),
                                Text(
                                  "Profile",
                                  style: getMediumStyle(
                                      fontSize: 17,
                                      color: AppColors.lightBlack),
                                ),
                              ],
                            )),
                        const Divider(),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, const ChangePasswordScreen());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  EneftyIcons.password_check_outline,
                                  color: AppColors.lightBlack,
                                ),
                                SizedBox(
                                  width: context.width * 0.03,
                                ),
                                SizedBox(
                                  width: context.width * 0.4,
                                  child: Text(
                                    "Change Password",
                                    style: getMediumStyle(
                                        fontSize: 17,
                                        color: AppColors.lightBlack),
                                  ),
                                ),
                              ],
                            )),
                        const Divider(),
                        ExpansionTile(
                          iconColor: AppColors.lightBlack,
                          collapsedIconColor: AppColors.lightBlack,
                          title: Text("Services",
                              style: getMediumStyle(
                                  color: AppColors.lightBlack, fontSize: 17)),
                          leading: const Icon(EneftyIcons.setting_2_outline),
                          children: [
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Rescue Winch",
                                style: getMediumStyle(
                                    color: AppColors.lightBlack, fontSize: 15),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Oil Change",
                                style: getMediumStyle(
                                    color: AppColors.lightBlack, fontSize: 15),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Brakes",
                                style: getMediumStyle(
                                    color: AppColors.lightBlack, fontSize: 15),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Tires",
                                style: getMediumStyle(
                                    color: AppColors.lightBlack, fontSize: 15),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Oil Filter",
                                style: getMediumStyle(
                                    color: AppColors.lightBlack, fontSize: 15),
                              ),
                            ),
                            ListTile(
                              onTap: () {},
                              title: Text(
                                "Battery",
                                style: getMediumStyle(
                                    color: AppColors.lightBlack, fontSize: 15),
                              ),
                            )
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              LoginCubit.logOut();
                              navigateAndFinish(context, const LoginScreen());
                            },
                            child: Row(
                              children: [
                                Icon(
                                  EneftyIcons.logout_outline,
                                  color: AppColors.lightBlack,
                                ),
                                SizedBox(
                                  width: context.width * 0.03,
                                ),
                                Text(
                                  "Log Out",
                                  style: getMediumStyle(
                                      fontSize: 17,
                                      color: AppColors.lightBlack),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
