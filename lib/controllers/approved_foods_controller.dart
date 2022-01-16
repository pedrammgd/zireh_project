import 'package:get/get.dart';
import 'package:zireh_project/models/food_view_model.dart';

class ApprovedFoodsController extends GetxController {
  RxList<FoodViewModel> foodList = <FoodViewModel>[
    FoodViewModel(
        title: 'پیتزا',
        city: '',
        isLocalFood: true,
        id: 1,
        category: '',
        description: '',
        suitableForMeals: ''),

  ].obs;
}
