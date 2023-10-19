import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:store_challenge/ui/shared/colors.dart';
import 'package:store_challenge/ui/shared/custom_widgets/custom_grid.dart';
import 'package:store_challenge/ui/shared/custom_widgets/custom_text.dart';
import 'package:store_challenge/ui/shared/extenssions/extenssions.dart';
import 'package:store_challenge/ui/shared/utils.dart';
import 'package:store_challenge/ui/views/main_view/product_view/product_view_controller.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductViewController controller = Get.put(ProductViewController());
    return Scaffold(
      body: ListView( shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          CustomText(
            text: 'All Products',
            fontsize:screenWidth(10),
            rightPadding: screenWidth(2.5),
            topPadding: screenWidth(15),
            bottomPadding: screenWidth(10),
            textcolor: AppColors.mainBlack,
            fontWeight: FontWeight.bold,
          ),
          (screenWidth(10)).sbh,
          Obx(() => controller.allProducts.isEmpty
              ? Center(
              child: SpinKitCircle(
                color: AppColors.mainblue1,
                size: screenWidth(5),
              ))
              : Wrap(
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: screenHieght(20),
            children: List.generate(controller.allProducts.length, (index) {
              return CustomGrid(
                allProducts: controller.allProducts,
                index: index,
              );
            }),
          ))
      ],)
    );
  }
}
