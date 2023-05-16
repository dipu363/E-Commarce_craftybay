import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value){

      },
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        prefixIcon: const Icon(Icons.search,color: grayColor,),
        hintText: 'Search',
        filled: true,
        fillColor: graySoftColor.withOpacity(0.2),
        enabledBorder:
        OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
        focusedBorder:
        OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}