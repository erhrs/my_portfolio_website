import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_portfolio_website/views/portfolio_home.dart';
import 'package:my_portfolio_website/widgets/theme_controller.dart';

void main() {
  Get.put(ThemeController()); // Put theme controller in memory
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    return Obx(() => GetMaterialApp(
      title: 'Harsh Yadav | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: themeController.currentTheme,
      home: const PortfolioHome(),
    ));
  }
}

