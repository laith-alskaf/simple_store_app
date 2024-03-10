import 'package:LaithStore/core/utilis/general_util.dart';
import 'package:get/get.dart';

class MyAppController extends GetxController {
  RxInt numProdInCart = cartServices.getCartCount().obs;
}
