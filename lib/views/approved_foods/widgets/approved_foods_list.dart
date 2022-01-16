import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zireh_project/controllers/approved_foods_controller.dart';

import 'approved_foods_item.dart';

class ApprovedListPage extends GetView<ApprovedFoodsController> {
  const ApprovedListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: controller.foodList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ApprovedItemPage(index: index);
        },
      );
    });
  }
}
