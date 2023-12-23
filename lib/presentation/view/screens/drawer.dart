import 'package:carvanta/config/routes/app_routs.dart';
import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/core/utils/media_query_values.dart';
import 'package:carvanta/core/utils/style_manager.dart';
import 'package:carvanta/presentation/view/screens/change_password_screen.dart';
import 'package:carvanta/presentation/view/screens/main_screen.dart';
import 'package:carvanta/presentation/view/screens/profile_screen.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class DrawerHome extends StatefulWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      menuScreen: DrawerScreen(
        setIndex: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      mainScreen: const MainScreen(),
      borderRadius: 30,
      showShadow: true,
      angle: 0.0,
      slideWidth: 260,
      menuBackgroundColor: AppColors.lightBlack,
    );
  }
}

class DrawerScreen extends StatefulWidget {
  final ValueSetter setIndex;
  const DrawerScreen({Key? key, required this.setIndex}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBlack,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Carvanta",
              style: getBoldStyle(color: AppColors.white, fontSize: 30),
            ),
            SizedBox(
              height: context.height * 0.15,
            ),
            drawerList(
                EneftyIcons.user_outline, "Profile", const ProfileScreen()),
            drawerList(EneftyIcons.password_check_outline, "Change Password",
                const ChangePasswordScreen()),
          ],
        ),
      ),
    );
  }

  Widget drawerList(IconData icon, String text, Widget widget) {
    return InkWell(
      onTap: () {
        navigateTo(context, widget);
      },
      child: Container(
        width: context.width * 1,
        margin: const EdgeInsets.only(left: 20, bottom: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: getMediumStyle(color: Colors.white, fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        ZoomDrawer.of(context)!.toggle();
      },
      icon: Icon(
        Icons.menu,
        color: AppColors.white,
      ),
    );
  }
}
