import 'package:LaithStore/core/utilis/general_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_button.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_grid.dart';
import 'package:LaithStore/ui/shared/custom_widgets/custom_text.dart';
import 'package:LaithStore/ui/shared/extenssions/extenssions.dart';
import 'package:LaithStore/ui/shared/utils.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          children: [
            CustomText(
              text: 'Categories',
              fontsize: screenWidth(10),
              rightPadding: screenWidth(2.1),
              topPadding: screenWidth(15),
              bottomPadding: screenWidth(10),
              textcolor: AppColors.mainBlack,
              fontWeight: FontWeight.bold,
            ),
            Obx(
              () => homeController.allCategory.length == 1
                  ? Center(
                      child: SpinKitCircle(
                        size: screenWidth(5),
                        color: AppColors.mainblue1,
                      ),
                    )
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              homeController.allCategory.length, (index) {
                        final textLength =
                            homeController.allCategory[index].length;
                        final buttonWidth =
                            (textLength * (width * 0.03)) + width * 0.02;
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: screenWidth(30)),
                          child: CustomButton(
                            widthSize: buttonWidth > width * 0.15
                                ? buttonWidth
                                : width * 0.19,
                            backgroundColor:
                                homeController.selectedNum.value == index
                                    ? homeController.clickButton.value
                                    : AppColors.mainWhite,
                            borderColor:
                                homeController.selectedNum.value == index
                                    ? AppColors.mainWhite
                                    : AppColors.mainBorder,
                            text: homeController.allCategory[index],
                            textColor: homeController.selectedNum.value == index
                                ? AppColors.mainWhite
                                : AppColors.mainBlack,
                            onPressed: () {
                              homeController.changeBackground(
                                  index, homeController.allCategory[index]);
                            },
                          ),
                        );
                      })),
                    ),
            ),
            (screenWidth(40)).sbh,
            CustomText(
              text: 'Products',
              fontsize: screenWidth(10),
              rightPadding: screenWidth(1.8),
              topPadding: screenWidth(15),
              bottomPadding: screenWidth(10),
              textcolor: AppColors.mainBlack,
              fontWeight: FontWeight.bold,
            ),
            (screenWidth(90)).sbh,
            Obx(() => homeController.allProducts.isEmpty
                ? Center(
                    child: SpinKitCircle(
                    color: AppColors.mainblue1,
                    size: screenWidth(5),
                  ))
                : Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    runSpacing: screenHieght(20),
                    children: List.generate(homeController.allProducts.length,
                        (index) {
                      return CustomGrid(
                        allProducts: homeController.allProducts,
                        index: index,
                      );
                    }),
                  ))
          ]),
    );
  }
}
