import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zireh_project/controllers/approved_foods_controller.dart';
import 'package:zireh_project/models/food_view_model.dart';
import 'package:zireh_project/shared/widgets/custom_card_item.dart';

class ApprovedItemPage extends GetView<ApprovedFoodsController> {
  const ApprovedItemPage({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return  CustomCardItem(title: item.title,);
  }

  FoodViewModel get item => controller.foodList[index];
}
