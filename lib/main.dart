//project flow
// Analysis : details - target - deadline
// structure: layer structure
// MVC architecture
// State management : GETX
// Working flow : UI design => UI Functional => state management => API Integration

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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

