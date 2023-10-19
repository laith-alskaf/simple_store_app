import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_challenge/core/data/models/all_products_model.dart';
import 'package:store_challenge/core/data/repositories/all_categories_repositories.dart';
import 'package:store_challenge/core/data/repositories/all_products_repositories.dart';
import 'package:store_challenge/core/enums/message_type.dart';
import 'package:store_challenge/ui/shared/colors.dart';
import 'package:store_challenge/ui/shared/custom_widgets/custom_showtoast.dart';


class HomeViewController extends GetxController {
  Rx<Color> clickButton = AppColors.mainblue1.obs;
  RxInt selectedNum = 0.obs;
  RxList<String> allCategory=['All'].obs;
  RxList<AllProductsModel> allProducts=<AllProductsModel>[].obs;
  String selectCategory='';
  changeBackground(int index,String nameCategory){
    selectedNum.value = index;
    selectCategory=nameCategory;
    getALlProducts();
  }
  @override
  void onInit() {
    // TODO: implement onInit
    getALlCategory();
    getALlProducts();
    super.onInit();
  }
  Future getALlCategory()async{
    await AllCategoryRepositories.allCategory().then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        allCategory.addAll(r);
      });
    });
  }
  Future getALlProducts()async{
    selectedNum==0?selectCategory='':null;
    allProducts.value=<AllProductsModel>[];
    await GetProductsRepositories.getProducts(nameCategory: selectCategory).then((value) {
      value.fold((l) {
        CustomShowToast.showMessage(
            message: l, messageType: MessageType.REJECTED);
      }, (r) {
        allProducts.addAll(r);
      });
    });
  }

}