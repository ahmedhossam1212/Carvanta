import 'package:carvanta/config/routes/app_routs.dart';
import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/media_query_values.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:carvanta/presentation/view/screens/home_screen.dart';
import 'package:carvanta/presentation/view/screens/licence_screen.dart';
import 'package:carvanta/presentation/view/screens/notification_screen.dart';
import 'package:carvanta/presentation/view/screens/refuel_screen.dart';
import 'package:carvanta/presentation/view/screens/services_screen.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int curentIndex = 0;
  int selectedIndex = 0;

  List<String> services = [
    "Rescue Winch",
    "Oil change",
    "Brakes",
    "Tires",
    "Oil filter",
    "Battery"
  ];

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
      appBar: AppBar(
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
                width: context.width * 0.8,
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {},
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
                                    fontSize: 17, color: AppColors.lightBlack),
                              ),
                            ],
                          )),
                      const Divider(),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                EneftyIcons.password_check_outline,
                                color: AppColors.lightBlack,
                              ),
                              SizedBox(
                                width: context.width * 0.03,
                              ),
                              Text(
                                "Change Password",
                                style: getMediumStyle(
                                    fontSize: 17, color: AppColors.lightBlack),
                              ),
                            ],
                          )),
                      const Divider(),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                EneftyIcons.setting_2_outline,
                                color: AppColors.lightBlack,
                              ),
                              SizedBox(
                                width: context.width * 0.03,
                              ),
                              Text(
                                "Services",
                                style: getMediumStyle(
                                    fontSize: 17, color: AppColors.lightBlack),
                              ),
                              SizedBox(
                                width: context.width * 0.01,
                              ),
                              DropdownButton<String>(
                                alignment: Alignment.bottomLeft,
                                borderRadius: BorderRadius.circular(15),
                                elevation: 5,
                                icon: Icon(
                                  EneftyIcons.arrow_down_outline,
                                  color: AppColors.lightBlack,
                                ),
                                items: services
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.black),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (item) => setState(() {}),
                              ),
                            ],
                          )),
                      SizedBox(
                        height: context.height * 0.43,
                      ),
                      TextButton(
                          onPressed: () {},
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
                                    fontSize: 17, color: AppColors.lightBlack),
                              ),
                            ],
                          )),
                    ],
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
