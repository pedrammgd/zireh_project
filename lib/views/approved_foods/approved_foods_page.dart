import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zireh_project/controllers/approved_foods_controller.dart';
import 'package:zireh_project/core/constans/constans.dart';
import 'package:zireh_project/core/router/zireh_pages.dart';
import 'package:zireh_project/shared/widgets/custom_app_bar.dart';
import 'package:zireh_project/shared/widgets/custom_border_button.dart';
import 'package:zireh_project/views/add_food/add_food_page.dart';
import 'package:zireh_project/views/approved_foods/widgets/approved_foods_list.dart';

class ApprovedFoodsPage extends GetView<ApprovedFoodsController> {
  const ApprovedFoodsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ApprovedFoodsController());
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: const CustomAppBar(),
      body: ListView(
        children: [
          Constants.mediumVerticalSpacer,
          _title(),
          Constants.largeVerticalSpacer,
          _addFoodButton(),
          Constants.largeVerticalSpacer,
          const ApprovedListPage(),
        ],
      ),
    );
  }

  Widget _addFoodButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: CustomBorderButton(
        onPressed: () {
          Get.toNamed(ZirehRoutes.addFood,arguments: AddFoodPage.arguments(foodList: controller.foodList));
        },
        titleButton: 'افزودن غذای جدید',
      ),
    );
  }

  Widget _title() {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 15),
      child: Text(
        'لیست غذاهای ثبت شده',
        style: TextStyle(
            color: dimGrayColor, fontWeight: FontWeight.bold, fontSize: 17),
      ),
    );
  }
}
