import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zireh_project/models/food_view_model.dart';

class AddFoodController extends GetxController {

  TextEditingController titleTextEditingController = TextEditingController(text: 'آش سبزی');

  TextEditingController categoryTextEditingController = TextEditingController();
  TextEditingController suitableForMealsTextEditingController =
      TextEditingController();
  TextEditingController cityTextEditingController = TextEditingController();

  RxBool isExpandCategory = false.obs;
  RxBool isExpandSuitableForMeals = false.obs;
  RxBool isExpandCity = false.obs;
  RxBool isChecked = false.obs;
  final RxList<FoodViewModel> foodList;


  AddFoodController({required this.foodList});

  Rx<File> file = File('').obs;

  Future getImage(
    ImageSource imageSource,
  ) async {
    final pickFile = await ImagePicker().pickImage(source: imageSource);
    if (pickFile != null) {
      file.value = File(pickFile.path);
    } else {}
  }
}
