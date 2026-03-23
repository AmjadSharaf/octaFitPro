import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octafitpro/core/global/color/app_colors_dark.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        
        cursorHeight: 15,
        decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.zero,
          hintText: 'Search..',
          fillColor: Colors.transparent,
          prefixIcon: Icon(CupertinoIcons.search, size: 18),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: AppColorsDark.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
