import 'package:get/get.dart';
import 'package:LaithStore/core/data/models/all_products_model.dart';
import 'package:LaithStore/core/data/models/card_model.dart';
import 'package:LaithStore/core/utilis/general_util.dart';

class ProductDetailsController extends GetxController {
  ProductDetailsController({required AllProductsModel product}) {
    productDetails = product;
  }

  RxInt countProduct = 0.obs;
  dynamic productDetails;
  Rx<CartModel> cartModel = CartModel().obs;

  @override
  void onInit() {
    getCart();
    super.onInit();
  }

  getCart() {
    if (cartServices.getCartModel(productDetails) == null) {
      cartModel.value.count = 0;
      cartModel.value.total = 0;
      cartModel.value.product = productDetails;
    } else {
      cartModel.value = cartServices.getCartModel(productDetails)!;
      countProduct.value = cartModel.value.count!;
    }
  }

  addToCart() {
    cartServices.addToCart(
        model: productDetails,
        count: countProduct.value - cartModel.value.count!);
    myAppController.numProdInCart.value = cartServices.getCartCount();
  }

  changeCount({required bool incress}) {
    if (incress) {
      countProduct.value += 1;
    } else {
      countProduct.value -= 1;
    }
  }
}
