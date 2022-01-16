
import 'package:get/get.dart';
import 'package:zireh_project/views/add_food/add_food_page.dart';
import 'package:zireh_project/views/approved_foods/approved_foods_page.dart';

part 'zireh_routes.dart';

class ZirehPage {
  static const initial = ZirehRoutes.home;

  static final List<GetPage> routes = [
    GetPage(
      name: ZirehRoutes.home,
      page: () => const ApprovedFoodsPage(),
    ),
    GetPage(
      name: ZirehRoutes.addFood,
      page: () =>  AddFoodPage(),
    ),

  ];
}
