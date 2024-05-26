import 'package:LaithStore/core/data/models/card_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LaithStore/core/utilis/general_util.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_button.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_price.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_text.dart';
import 'package:LaithStore/ui/shared/utils.dart';
import 'package:LaithStore/ui/views/main_view/main_view.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth(20), vertical: screenWidth(15)),
          child: CustomButton(
            text: 'Continue Shopping',
            textSize: screenWidth(19),
            textColor: AppColors.mainWhite,
            widthSize: screenWidth(2.5),
            backgroundColor: AppColors.mainblue1,
            heightSize: screenWidth(8),
            onPressed: () {
              cartServices.clearCart();
              myAppController.numProdInCart.value =
                  cartServices.getCartCount();
              Get.offAll(() => const MainView());
            },
          ),
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
            child: Column(
              children: [
                CustomText(
                  text: 'Your order placed successfully',
                  fontsize: screenWidth(12),
                  bottomPadding: screenWidth(10),
                  isTextAlign: TextAlign.left,
                  topPadding: screenWidth(6),
                  textcolor: AppColors.mainBlack,
                  fontWeight: FontWeight.bold,
                ),
                CustomPrice(
                    horizontal: 100,
                    text1: 'Order NO : ',
                    fontSizeText1: screenWidth(24),
                    sbw: 20,
                    fontSizeText2: screenWidth(25),
                    showSP: false,
                    isSpacer: false,
                    text2: '#123910',
                    mainAxisAlignment: MainAxisAlignment.start),
                CustomPrice(
                    text1: 'Items Count : ',
                    isSpacer: false,
                    fontSizeText1: screenWidth(24),
                    fontSizeText2: screenWidth(25),
                    text2: cartServices.cartCount.toString(),
                    bottomPadding: 17,
                    showSP: false,
                    sbw: 100,
                    horizontal: 100,
                    mainAxisAlignment: MainAxisAlignment.start),
                Divider(
                    thickness: screenWidth(150),
                    endIndent: screenWidth(90),
                    indent: screenWidth(90),
                    color: AppColors.mainblue1),
                CustomPrice(
                  text1: 'Sub Total : ',
                  horizontal: 15,
                  mainAxisAlignment: MainAxisAlignment.start,
                  isSpacer: true,
                  text2: cartServices.subTotal.toStringAsFixed(3),
                  moreDivider: true,
                  fontSizeText1: screenWidth(24),
                  fontSizeText2: screenWidth(25),
                ),
                CustomPrice(
                    text1: 'Tax : ',
                    isSpacer: true,
                    horizontal: 15,
                    mainAxisAlignment: MainAxisAlignment.start,
                    fontSizeText1: screenWidth(24),
                    fontSizeText2: screenWidth(25),
                    text2: cartServices.tax.toStringAsFixed(3),
                    moreDivider: true),
                CustomPrice(
                    text1: 'Delivery Fees : ',
                    fontSizeText1: screenWidth(24),
                    fontSizeText2: screenWidth(25),
                    isSpacer: true,
                    horizontal: 15,
                    mainAxisAlignment: MainAxisAlignment.start,
                    text2: cartServices.deliverFees.toStringAsFixed(3),
                    moreDivider: true),
                CustomPrice(
                  text1: 'Total : ',
                  isSpacer: true,
                  horizontal: 15,
                  mainAxisAlignment: MainAxisAlignment.start,
                  fontSizeText1: screenWidth(24),
                  fontSizeText2: screenWidth(25),
                  text2: cartServices.total.toStringAsFixed(4),
                  text1Color: AppColors.redColor,
                ),
                Divider(
                    thickness: screenWidth(150),
                    endIndent: screenWidth(90),
                    indent: screenWidth(90),
                    color: AppColors.mainblue1),
              ],
            ),
          ),
        ));
  }
}
