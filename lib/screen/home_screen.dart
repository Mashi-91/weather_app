import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/screen/home_controller.dart';
import 'package:weather_app/widgets/customTextWidgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xff242424),
      body: GetBuilder<HomeController>(builder: (_) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xff747474),
                  ),
                  const SizedBox(height: 12),
                  CustomTextWidget(
                    text: controller.weatherModel?.cityName ?? 'Loading...',
                    size: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              Expanded(
                child: Lottie.asset(
                  controller.getWeatherAnimation(
                      controller.weatherModel?.mainCondition),
                ),
              ),
              CustomTextWidget(
                text:
                    '${controller.weatherModel?.cityTemperature.toInt() ?? 'Loading...'}°',
                size: 40,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
        );
      }),
    );
  }
}
