import 'package:get/get.dart';
import 'package:LaithStore/core/data/models/all_products_model.dart';
import 'package:LaithStore/core/utilis/general_util.dart';

class CartViewController extends GetxController {
  RxInt countProduct = 0.obs;

  @override
  void onInit() {
    initCart();
    super.onInit();
  }

  initCart() {
    if (storage.getCartList().isNull) {
    } else {
      cartServices.calcCartTotal();
      cartServices.getCartCount();
    }
  }

  changeCount(
      {required bool incress, required AllProductsModel productDetails}) {
    if (incress) {
      cartServices.changeCount(
          incress: true, model: cartServices.getCartModel(productDetails)!);
      countProduct.value += 1;
    } else {
      countProduct.value -= 1;
    }
  }
}
