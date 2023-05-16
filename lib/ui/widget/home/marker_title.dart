import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/style.dart';

class MarkerTitleWidget extends StatelessWidget {
  const MarkerTitleWidget({
    super.key, required this.title, required this.onTap,
  });

  final String title;
  final VoidCallback onTap ;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:  [
        Text( title,style: titleTextStyle.copyWith(fontSize: 18,fontWeight: FontWeight.w600),),
        TextButton( onPressed: onTap, child: const Text('See All',style: TextStyle(fontSize: 16,color: primaryColor),),)
      ],
    );
  }
}