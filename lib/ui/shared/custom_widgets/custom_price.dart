import 'package:flutter/material.dart';
import 'package:store_challenge/ui/shared/colors.dart';
import 'package:store_challenge/ui/shared/custom_widgets/custom_text.dart';
import 'package:store_challenge/ui/shared/extenssions/extenssions.dart';
import 'package:store_challenge/ui/shared/utils.dart';

class CustomPrice extends StatelessWidget {
  const CustomPrice(
      {super.key,
      required this.text1,
      required this.text2,
      this.text1Color,
      this.text2Color,
      this.moreDivider = false,
      this.showSP = true,
      this.sbw,
      this.horizontal,
      this.isSpacer = false, this.bottomPadding, this.mainAxisAlignment, this.fontSizeText1, this.fontSizeText2});

  final String text1;
  final String text2;
  final Color? text1Color;
  final Color? text2Color;
  final bool? moreDivider;
  final bool? showSP;
  final double? sbw;
  final double? horizontal;
  final bool? isSpacer;
  final double? bottomPadding;
  final double? fontSizeText1;
  final double? fontSizeText2;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth(horizontal ?? 7), vertical: screenWidth(80)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment:mainAxisAlignment?? MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                fontWeight: FontWeight.bold,
                text: text1,
                textcolor: text1Color ?? AppColors.mainblue1,
                bottomPadding: screenWidth(bottomPadding??100),
                isTextAlign: TextAlign.left,
                fontsize:fontSizeText1??width * 0.035 ,
              ),
              isSpacer! ? const Spacer() : (screenWidth(sbw ?? 5)).sbw,
              CustomText(
                text: text2,
                fontWeight: FontWeight.bold,
                textcolor: text2Color ?? AppColors.mainBlack,
                bottomPadding: screenWidth(bottomPadding??100),
                fontsize:fontSizeText2??width * 0.035 ,
              ),
              isSpacer! ? (screenWidth(sbw ?? 20)).sbw : const SizedBox(),
              showSP!
                  ? CustomText(
                      text: 'SP',
                      fontWeight: FontWeight.bold,
                      textcolor: AppColors.mainBlack,
                bottomPadding: screenWidth(bottomPadding??100),
                    )
                  : const SizedBox(),
            ],
          ),
          moreDivider!
              ? Divider(
                  thickness: screenWidth(190),
                  endIndent: screenWidth(100),
                  indent: screenWidth(100),
                  color: AppColors.mainBorder)
              : const SizedBox()
        ],
      ),
    );
  }
}
