import 'package:carvanta/config/routes/app_routs.dart';
import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:carvanta/presentation/view/screens/drawer.dart';
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
        leading: const DrawerWidget(),
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
    );
  }
}
