import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zireh_project/controllers/add_food_controller.dart';
import 'package:zireh_project/core/constans/constans.dart';
import 'package:zireh_project/models/food_view_model.dart';
import 'package:zireh_project/shared/widgets/camera_gallery_dialog.dart';
import 'package:zireh_project/shared/widgets/custom_app_bar.dart';
import 'package:zireh_project/shared/widgets/custom_border_button.dart';
import 'package:zireh_project/shared/widgets/custom_image_picker.dart';
import 'package:zireh_project/shared/widgets/custom_text_form_field.dart';
import 'package:zireh_project/shared/widgets/expandable/custom_expandable.dart';

class AddFoodPage extends GetView<AddFoodController> {
  final CustomExpandableController expandableControllerCategory =
      CustomExpandableController(false);
  final CustomExpandableController expandableControllerSuitableForMeals =
      CustomExpandableController(false);
  final CustomExpandableController expandableControllerCity =
      CustomExpandableController(false);

  void _initArguments() {
    if (Get.arguments == null) return;
    final arguments = Get.arguments as Map;
    final foodList = arguments['foodList'];

    Get.put(AddFoodController(foodList: foodList));
  }

  @override
  Widget build(BuildContext context) {
    _initArguments();
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: const CustomAppBar(
        hasBackButton: true,
      ),
      body: ListView(
        children: [
          _title(),
          _imagePicker(context),
          _categoryTextFormField(),
          Constants.mediumVerticalSpacer,
          _titleTextFormField(),
          Constants.mediumVerticalSpacer,
          _descriptionTextFormField(),
          Constants.mediumVerticalSpacer,
          _suitableForMealsTextFormField(),
          _isLocalFood(),
          Constants.mediumVerticalSpacer,
          _cityTextFormField(),
          Constants.mediumVerticalSpacer,
          _addButton(),
          Constants.mediumVerticalSpacer,
        ],
      ),
    );
  }

  Widget _imagePicker(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Obx(() {
        return Row(
          children: [
            CustomImagePicker(
              file: controller.file.value,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants.xLargeVerticalSpacer,
                Text(
                  'تصویر غذا',
                  style: TextStyle(
                      color: lightGrayColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                Constants.smallVerticalSpacer,
                InkWell(
                    onTap: () {
                      CameraOrGalleryDialog.chooseCameraOrGallery(
                        context,
                        cameraButtonFunction: () {
                          controller.getImage(ImageSource.camera);
                          Navigator.pop(context);
                        },
                        galleryButtonFunction: () {
                          controller.getImage(ImageSource.gallery);
                          Navigator.pop(context);
                        },
                      );
                    },
                    child: Text(
                      'تغییر تصویر',
                      style: TextStyle(
                          color: pinkColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ))
              ],
            )
          ],
        );
      }),
    );
  }

  Widget _title() => Padding(
        padding:
            const EdgeInsetsDirectional.only(start: 20, top: 20, bottom: 20),
        child: Text('ثبت غذای جدید',
            style: TextStyle(
                color: dimGrayColor,
                fontWeight: FontWeight.bold,
                fontSize: 17)),
      );

  Widget _addButton() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: CustomBorderButton(
          onPressed: () {
            controller.foodList.add(FoodViewModel(
                title: controller.titleTextEditingController.text,
                city: '',
                isLocalFood: true,
                id: 1,
                category: '',
                description: '',
                suitableForMeals: ''));
            Get.back();
          },
          isFilled: true,
          backgroundColor: crimsonColor,
          titleButton: 'تایید و ادامه',
        ),
        // ElevatedButton(onPressed: () {}, child: const Text('تایید و ادامه')),
      );

  Widget _cityTextFormField() {
    return _textFormFielDropDown(
      expandableController: expandableControllerCity,
      controllerTextEditing: controller.cityTextEditingController,
      labelTextField: 'استان',
      expandedWidget: _dropDownItems(
        isExpanded: controller.isExpandCity,
        expandableController: expandableControllerCity,
        items: cityItems,
        textEditingController: controller.cityTextEditingController,
      ),
      isExpand: controller.isExpandCity,
    );
  }

  Widget _isLocalFood() => Obx(() {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Row(
            children: [
              Text(
                'آیا غذا محلی است؟',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: dimGrayColor),
              ),
              const Spacer(),
              Text(
                'خیر',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: dimGrayColor),
              ),
              Switch(
                activeColor: pinkColor,
                value: controller.isChecked.value,
                onChanged: (value) {
                  controller.isChecked.value = value;
                },
              ),
              Text(
                'بله',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        controller.isChecked.value ? pinkColor : dimGrayColor),
              ),
            ],
          ),
        );
      });

  Widget _suitableForMealsTextFormField() {
    return _textFormFielDropDown(
      expandableController: expandableControllerSuitableForMeals,
      controllerTextEditing: controller.suitableForMealsTextEditingController,
      labelTextField: 'مناسب برای وعده',
      expandedWidget: _dropDownItems(
        isExpanded: controller.isExpandSuitableForMeals,
        expandableController: expandableControllerSuitableForMeals,
        items: suitableForMealsItems,
        textEditingController: controller.suitableForMealsTextEditingController,
      ),
      isExpand: controller.isExpandSuitableForMeals,
    );
  }

  Widget _descriptionTextFormField() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: CustomTextFormField(labelText: 'توضیحات یا دستور پخت'),
    );
  }

  Widget _titleTextFormField() {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: CustomTextFormField(labelText: 'عنوان',controller: controller.titleTextEditingController,),
    );
  }

  Widget _categoryTextFormField() {
    return _textFormFielDropDown(
      expandableController: expandableControllerCategory,
      controllerTextEditing: controller.categoryTextEditingController,
      labelTextField: 'دسته بندی',
      expandedWidget: _dropDownItems(
        items: categoryItems,
        textEditingController: controller.categoryTextEditingController,
        expandableController: expandableControllerCategory,
        isExpanded: controller.isExpandCategory,
      ),
      isExpand: controller.isExpandCategory,
    );
  }

  Widget _textFormFielDropDown(
      {required CustomExpandableController expandableController,
      required String labelTextField,
      required Widget expandedWidget,
      TextEditingController? controllerTextEditing,
      required RxBool isExpand}) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: CustomExpandable(
          splashRadius: 20,
          headerBodySpace: 1,
          iconSize: 29,
          controller: expandableController,
          paddingIconTop: 5,
          customCurve: Curves.easeInBack,
          milliseconds: 500,
          defaultHeaderIconColor: Colors.black,
          headerWidget: CustomTextFormField(
            controller: controllerTextEditing,
            labelText: labelTextField,
            readOnly: true,
            suffixIcon: InkWell(
              onTap: () {
                isExpand.value = !isExpand.value;
                expandableController.toggle();
              },
              child: CustomExpandIcon(
                isExpanded: isExpand.value,
                color: pinkColor,
                padding: const EdgeInsets.only(top: 5, left: 8),
                size: 34,
              ),
            ),
          ),
          defaultHeaderDecoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.1),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 8), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadiusDirectional.circular(20),
          ),
          expandedWidget: expandedWidget,
        ),
      );
    });
  }

  Widget _dropDownItems({
    required List<String> items,
    required RxBool isExpanded,
    required CustomExpandableController expandableController,
    TextEditingController? textEditingController,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView.builder(
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.white70, width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                textEditingController?.text = items[index];
                expandableController.toggle();
                isExpanded.value = !isExpanded.value;
              },
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  items[index],
                  style: TextStyle(
                      color: pinkColor,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              )),
            ),
          );
        },
      ),
    );
  }

  List<String> categoryItems = ['پر پروتیین', 'کم پروتیین'];
  List<String> suitableForMealsItems = ['صبحانه', 'نهار', 'شام'];
  List<String> cityItems = ['شیراز', 'تهران', 'مشهد'];

  static Map arguments({
    required RxList<FoodViewModel> foodList,
  }) {
    final map = {};
    map['foodList'] = foodList;
    return map;
  }
}
