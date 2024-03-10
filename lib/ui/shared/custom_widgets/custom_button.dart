import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:LaithStore/ui/shared/colors.dart';
import 'package:LaithStore/ui/shared/utils.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.backgroundColor,
    required this.textColor,
    this.borderColor,
    this.onPressed,
    this.imageName,
    this.paddingLR,
    this.widthSize,
    this.heightSize,
    this.isBackgroundColor = true, this.textSize, this.isCircle=false,
  });

  final String text;

  final String? imageName;
  final Color? backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double? paddingLR;
  final double? widthSize, heightSize;
  final bool isBackgroundColor;
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;
  final double? textSize;
  final bool? isCircle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed ?? () {},
        style: ElevatedButton.styleFrom(
          shape:isCircle!? const CircleBorder(): RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(width * 0.4)),
          backgroundColor: isBackgroundColor
              ? (backgroundColor ?? AppColors.mainPurple1)
              : null,
          side: borderColor != null
              ? BorderSide(
                  width: 1.0, color: borderColor ?? AppColors.mainWhite)
              : null,
          maximumSize: Size(widthSize ?? width, heightSize ?? height * 0.07),
          minimumSize:
              Size(widthSize ?? width * 0.01, heightSize ?? height * 0.07),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (imageName != null) ...[
            SvgPicture.asset(
              'assets/images/$imageName.svg',
              width: width * 0.09,
            ),
            SizedBox(width: width * 0.04)
          ],
          Text(text,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold,fontSize:textSize ))
        ]));
  }
}
