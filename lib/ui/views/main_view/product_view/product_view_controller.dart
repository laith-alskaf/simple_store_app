import 'package:get/get.dart';
import 'package:LaithStore/core/data/models/all_products_model.dart';
import 'package:LaithStore/core/data/repositories/all_products_repositories.dart';
import 'package:LaithStore/core/enums/message_type.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_showtoast.dart';

class ProductViewController extends GetxController{
  RxList<AllProductsModel> allProducts=<AllProductsModel>[].obs;
  @override
  void onInit() {
    getALlProducts();
    super.onInit();
  }
  Future getALlProducts()async{
    allProducts.value=<AllProductsModel>[];
    await GetProductsRepositories.getProducts().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        allProducts.addAll(r);
      });
    });
  }
}