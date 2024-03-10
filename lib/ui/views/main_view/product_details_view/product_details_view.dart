import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:LaithStore/core/data/models/all_products_model.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_button.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_text.dart';
import 'package:LaithStore/ui/shared/extenssions/extenssions.dart';
import 'package:LaithStore/ui/shared/utils.dart';
import 'package:LaithStore/ui/views/main_view/product_details_view/product_details_controller.dart';

class ProductdetailsView extends StatefulWidget {
  const ProductdetailsView({super.key, required this.product});
  final AllProductsModel product;

  @override
  State<ProductdetailsView> createState() => _ProductdetailsViewState();
}

class _ProductdetailsViewState extends State<ProductdetailsView> {
  late ProductDetailsController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = Get.put(ProductDetailsController(product: widget.product));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: Container(
      width: double.infinity,
      height: screenWidth(5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(
                screenWidth(20),
              ),
              topLeft: Radius.circular(
                screenWidth(20),
              ))),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
          child: Obx(
                () => Row(
              children: [
                CustomButton(
                  text: 'Add To Cart',
                  textSize: screenWidth(19),
                  textColor: AppColors.mainWhite,
                  widthSize: screenWidth(2.5),
                  backgroundColor: AppColors.mainblue1,
                  heightSize: screenWidth(10),
                  onPressed: () {
                    controller.addToCart();
                  },
                ),
                const Spacer(),
                CustomButton(
                  text: '-',
                  textSize: screenWidth(19),
                  isCircle: true,
                  textColor: AppColors.mainWhite,
                  widthSize: screenWidth(10),
                  heightSize: screenWidth(10),
                  backgroundColor: AppColors.mainblue1,
                  onPressed: () {
                    controller.changeCount(incress: false);
                  },
                ),
                (screenWidth(40)).sbw,
                CustomText(
                  text: controller.countProduct.value.toString(),
                  fontsize: screenWidth(14),
                ),
                (screenWidth(40)).sbw,
                CustomButton(
                  text: '+',
                  textSize: screenWidth(27),
                  isCircle: true,
                  textColor: AppColors.mainWhite,
                  backgroundColor: AppColors.mainblue1,
                  widthSize: screenWidth(10),
                  heightSize: screenWidth(10),
                  onPressed: () {
                    controller.changeCount(incress: true);
                  },
                )
              ],
            ),
          )),
    ) ,
        body: Obx(
      () => ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth(15), vertical: screenWidth(20)),
            child: Column(
              children: [
                CustomText(
                  text: controller.cartModel.value.product!.title.toString(),
                  fontsize: screenWidth(20),
                  isTextAlign: TextAlign.left,
                  textcolor: AppColors.mainBlack,
                ),
                (screenWidth(10)).sbh,
                Image.network(
                  controller.cartModel.value.product!.image.toString(),
                  height: screenWidth(3),
                  fit: BoxFit.contain,
                  width: screenWidth(1),
                ),
                (screenWidth(10)).sbh,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: ':Description',
                      fontsize: screenWidth(20),
                      fontWeight: FontWeight.bold,
                      isTextAlign: TextAlign.left,
                      textcolor: AppColors.mainblue1,
                    ),
                    RatingBar.builder(
                      initialRating:
                      controller.cartModel.value.product!.rating!.rate as double,
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: screenWidth(25),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: AppColors.mainblue1,
                      ),
                      ignoreGestures: true,
                      onRatingUpdate: (rating) {
                        rating;
                      },
                    ),
                  ],
                ),
                (screenWidth(30)).sbh,
                CustomText(
                  text: controller.cartModel.value.product!.description
                      .toString(),
                  fontsize: screenWidth(20),
                  isTextAlign: TextAlign.left,
                  textcolor: AppColors.mainBlack,
                ),
                (screenWidth(10)).sbh,
                Row(
                  children: [
                    CustomText(
                      text: ':Category ',
                      fontWeight: FontWeight.bold,
                      fontsize: screenWidth(20),
                      isTextAlign: TextAlign.left,
                      textcolor: AppColors.mainblue1,
                    ),
                    CustomText(
                      text: controller.cartModel.value.product!.category
                          .toString(),
                      fontsize: screenWidth(25),
                      isTextAlign: TextAlign.left,
                      textcolor: AppColors.mainBlack,
                    ),
                  ],
                ),
                (screenWidth(10)).sbh,
                Row(
                  children: [
                    CustomText(
                      text: ':Price ',
                      fontsize: screenWidth(20),
                      fontWeight: FontWeight.bold,
                      isTextAlign: TextAlign.left,
                      textcolor: AppColors.mainblue1,
                    ),
                    CustomText(
                      text:
                          controller.cartModel.value.product!.price.toString(),
                      fontsize: screenWidth(25),
                      isTextAlign: TextAlign.left,
                      textcolor: AppColors.mainBlack,
                    ),
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    ));
  }
}
