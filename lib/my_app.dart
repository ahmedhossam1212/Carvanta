import 'package:carvanta/core/utils/app_colors.dart';
import 'package:carvanta/presentation/view/widgets/input_field.dart';
import 'package:carvanta/presentation/view/widgets/main_button.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tester(),
    );
  }
}

class Tester extends StatelessWidget {
  Tester({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          defualtFormField(context,
              controller: textEditingController,
              validate: () {},
              hint: "hint",
              type: TextInputType.name,
              suffix: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    EneftyIcons.arrow_left_3_bold,
                    color: AppColors.lightBlack,
                  ))),
          const SizedBox(
            height: 50,
          ),
          mainButton(context,
              onpressd: () {}, background: AppColors.red, text: "text")
        ]),
      ),
    );
  }
}
