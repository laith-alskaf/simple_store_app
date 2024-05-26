import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LaithStore/core/data/models/card_model.dart';
import 'package:LaithStore/core/utilis/general_util.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_button.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_price.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_text.dart';
import 'package:LaithStore/ui/shared/extenssions/extenssions.dart';
import 'package:LaithStore/ui/shared/utils.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({super.key, required this.cartList, required this.index});

  final List<CartModel> cartList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth(20), vertical: screenWidth(20)),
        child: Obx(
          () => Container(
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(screenWidth(30))),
                border: Border.all(
                  color: AppColors.mainBorder,
                  width: screenWidth(150),
                )),
            child: Row(
              children: [
                Image.network(
                  cartList[index].product!.image.toString(),
                  height: screenWidth(5),
                  fit: BoxFit.contain,
                  width: screenWidth(5),
                ),
                SizedBox(
                  width: screenWidth(2.5),
                  child: Column(
                    children: [
                      (screenWidth(10)).sbh,
                      CustomText(
                        text: cartList[index].product!.title.toString(),
                        textcolor: AppColors.mainBlack,
                      ),
                      (screenWidth(30)).sbh,
                      CustomPrice(
                          text1: 'Price : ',
                          showSP: false,
                          text2: cartList[index]
                              .product!
                              .price!
                              .toStringAsFixed(2),
                          sbw: 20,
                          horizontal: 50),
                      (screenWidth(40)).sbh,
                      CustomPrice(
                        showSP: false,
                        text1: 'total : ',
                        text2: cartList[index].total!.toStringAsFixed(2),
                        sbw: 20,
                        horizontal: 50,
                      ),
                      (screenWidth(30)).sbh,
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        cartServices.removeFromCartList(cartList[index]);
                        myAppController.numProdInCart.value =
                            cartServices.getCartCount();
                      },
                      child: Icon(
                        Icons.disabled_by_default_rounded,
                        color: AppColors.redColor,
                      ),
                    ),
                    (screenWidth(5)).sbh,
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            cartServices.changeCount(
                                incress: false, model: cartList[index]);
                            myAppController.numProdInCart.value =
                                cartServices.getCartCount();
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: screenWidth(20),
                            height: screenWidth(20),
                            decoration: BoxDecoration(
                                color: AppColors.mainPurple1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: CustomText(
                              text: '-',
                              textcolor: AppColors.mainWhite,
                              fontsize: screenWidth(25),
                            ),
                          ),
                        ),
                        CustomText(
                          leftPadding: screenWidth(80),
                          rightPadding: screenWidth(80),
                          text: cartServices
                              .getCartModel(cartList[index].product!)!
                              .count
                              .toString(),
                        ),
                        GestureDetector(
                          onTap: () {
                            cartServices.changeCount(
                                incress: true, model: cartList[index]);
                            myAppController.numProdInCart.value =
                                cartServices.getCartCount();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: screenWidth(45)),
                            alignment: Alignment.center,
                            width: screenWidth(20),
                            height: screenWidth(20),
                            decoration: BoxDecoration(
                                color: AppColors.mainPurple1,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100))),
                            child: CustomText(
                              text: '+',
                              textcolor: AppColors.mainWhite,
                              fontsize: screenWidth(25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
