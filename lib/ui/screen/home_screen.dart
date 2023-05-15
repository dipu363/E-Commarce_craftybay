
import 'package:flutter/material.dart';
import '../widget/app_bar_icon_boutton.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo_nav.png'),
           const Spacer(),
           AppBarIconButton(iconData: Icons.person_outline, onTap: (){}),
           AppBarIconButton(iconData: Icons.call_outlined, onTap: (){}),
           AppBarIconButton(iconData: Icons.notifications_outlined, onTap: (){}),

          ],
        ),
      ),
    );
  }
}




