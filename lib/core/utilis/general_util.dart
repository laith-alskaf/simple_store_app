import 'package:get/get.dart';
import 'package:LaithStore/core/data/repositories/shared_preference_repositories.dart';
import 'package:LaithStore/core/services/cart_servces/cart_service.dart';
import 'package:LaithStore/core/utilis/network_utilis.dart';
import '../../app/my_app_controller.dart';
import '../../ui/views/main_view/home_view/home_view_controller.dart';

String getFullImageUrl(String url) {
  var splitedString = url.split('Images/');
  return 'https://${NetworkUtil.baseUrl}/Images/${splitedString[1]}';
}

SharedPreferenceRepositories get storage =>
    Get.find<SharedPreferenceRepositories>();


CartServices get cartServices => Get.find<CartServices>();


MyAppController get myAppController => Get.find<MyAppController>();
HomeViewController get homeController => Get.find<HomeViewController>();


double get taxAmount => 0.18;
double get deliveryAmount => 0.1;
//!------------------------------------
