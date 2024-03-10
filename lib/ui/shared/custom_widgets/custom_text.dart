import 'package:flutter/material.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/utils.dart';
class CustomText extends StatelessWidget {
   const CustomText(
      {super.key,
      required this.text,
      this.textcolor,
      this.fontsize,
      this.fontWeight,
      this.isDecoration = false,
      this.isTextAlign,
      this.heighText, this.bottomPadding, this.leftPadding, this.rightPadding, this.topPadding});

  final String text;
  final double? fontsize;
  final Color? textcolor;
  final bool isDecoration;
  final TextAlign? isTextAlign;
  final FontWeight? fontWeight;
  final double? heighText;
  final double? bottomPadding;
  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: bottomPadding ?? 0,
          right: rightPadding ?? 0,
          left: leftPadding ?? 0,
          top: topPadding ?? 0),
      child: Text(
        text,
        textAlign: isTextAlign ??TextAlign.right,
        overflow: TextOverflow.visible,
        // maxLines: 1,
        style: TextStyle(
            height: heighText ?? 1.0,

            // fontFamily: 'Alexandria-Regular',
            decoration: isDecoration ? TextDecoration.underline : null,
            color: textcolor ?? AppColors.mainPurple1,
            // ignore: prefer_if_null_operators
            fontSize: fontsize ?? width * 0.035,
            // ignore: prefer_if_null_operators
            fontWeight: fontWeight ?? FontWeight.w300),
      ),
    );
  }
}
