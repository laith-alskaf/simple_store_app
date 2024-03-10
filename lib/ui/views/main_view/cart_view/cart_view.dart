import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LaithStore/core/utilis/general_util.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_button.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_price.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_text.dart';
import 'package:LaithStore/ui/shared/extenssions/extenssions.dart';
import 'package:LaithStore/ui/shared/utils.dart';
import 'package:LaithStore/ui/views/main_view/cart_view/cart_view_controller.dart';
import 'package:LaithStore/ui/views/main_view/cart_view/custom_cart.dart';
import 'package:LaithStore/ui/views/main_view/checkout_view/checkout_view.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late CartViewController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = Get.put(CartViewController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => cartServices.cartList.isEmpty
          ? Center(
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: screenWidth(10)),
              height: screenWidth(2),
              child: CustomText(
                text: 'Nothing to display\nCart is empty',
                fontsize: screenWidth(14),
                heighText: 2,
                textcolor: AppColors.mainBlack,
                fontWeight: FontWeight.bold,
                isTextAlign: TextAlign.center,
              ),
            ))
          : ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [
                CustomText(
                  text: 'Cart',
                  fontsize: screenWidth(10),
                  rightPadding: screenWidth(1.32),
                  topPadding: screenWidth(15),
                  textcolor: AppColors.mainBlack,
                  fontWeight: FontWeight.bold,
                ),
                Wrap(
                  children: List.generate(cartServices.cartList.length, (index) {
                    return CustomCart(
                        cartList: cartServices.cartList, index: index);
                  }),
                ),
                Divider(
                    thickness: screenWidth(150),
                    endIndent: screenWidth(19),
                    indent: screenWidth(19),
                    color: AppColors.mainblue1),
                CustomPrice(
                  text1: ':Sub Total',
                  isSpacer: true,
                  text2: cartServices.subTotal.toStringAsFixed(3),
                  moreDivider: true,
                ),
                CustomPrice(
                    text1: ':Tax',
                    isSpacer: true,
                    text2: cartServices.tax.toStringAsFixed(3),
                    moreDivider: true),
                CustomPrice(
                    text1: ':Delivery Fees',
                    isSpacer: true,
                    text2: cartServices.deliverFees.toStringAsFixed(3),
                    moreDivider: true),
                CustomPrice(
                  text1: ':Total',
                  isSpacer: true,
                  text2: cartServices.total.toStringAsFixed(4),
                  text1Color: AppColors.redColor,
                ),
                Divider(
                    thickness: screenWidth(150),
                    endIndent: screenWidth(19),
                    indent: screenWidth(19),
                    color: AppColors.mainblue1),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth(20)),
                  child: CustomButton(
                    text: 'Placed Order',
                    textSize: screenWidth(19),
                    textColor: AppColors.mainWhite,
                    widthSize: screenWidth(2.5),
                    backgroundColor: AppColors.mainblue1,
                    heightSize: screenWidth(10),
                    onPressed: () {Get.to(()=>const CheckoutView());},
                  ),
                ),
                (screenWidth(20)).sbh,
                Center(
                  child: InkWell(
                    onTap: () {
                      cartServices.clearCart();
                    },
                    child: CustomText(
                      text: 'Empty Cart',
                      fontsize: screenWidth(25),
                      textcolor: AppColors.redColor,
                      fontWeight: FontWeight.bold,
                      isDecoration: true,
                    ),
                  ),
                ),
              ],
            ),
    ));
  }
}
