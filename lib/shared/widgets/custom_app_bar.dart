import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zireh_project/core/constans/constans.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({this.hasBackButton = false});

  final bool hasBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: SafeArea(
          child: Center(
              child: Image.asset(
        ZirehIcon,
        width: 70,
        height: 70,
      ))),
      leading: hasBackButton
          ? Center(
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: pinkColor,
                    size: 30,
                  )))
          : const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
