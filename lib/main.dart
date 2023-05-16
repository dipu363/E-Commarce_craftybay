//project flow
// Analysis : details - target - deadline
// structure: layer structure
// MVC architecture
// State management : GETX
// Working flow : UI design => UI Functional => state management => API Integration

import '../ui/utils/app_colors.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CraftyBay());
}

class CraftyBay extends StatelessWidget {
  const CraftyBay({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      themeMode: ThemeMode.light,
      darkTheme: ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,

        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w400
                )
            )
        ),
      ),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
          elevation: 1,
        ),

        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            textStyle: const TextStyle(
                fontWeight: FontWeight.w400
            )
          )
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

