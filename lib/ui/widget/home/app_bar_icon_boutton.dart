
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key, required this.iconData, required this.onTap,
  });


  final IconData iconData;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: primaryColor.withOpacity(0.3),
      child:  Padding(
        padding: const EdgeInsets.all(4.0),
        child:  CircleAvatar(
          radius: 16,
          backgroundColor: graySoftColor,
          child: Icon(
            iconData,
            color: grayColor,
          ),
        ),
      ),
    );
  }
}