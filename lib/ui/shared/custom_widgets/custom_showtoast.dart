import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_challenge/core/enums/message_type.dart';
import 'package:store_challenge/ui/shared/colors.dart';
import 'package:store_challenge/ui/shared/custom_widgets/custom_text.dart';
import 'package:store_challenge/ui/shared/utils.dart';

class CustomShowToast {
  static showMessage(
      {required String message,
      MessageType? messageType = MessageType.INFO,
      double? fontsize}) {
    String imageName;
    Color shadowColor;

    switch (messageType) {
      case MessageType.REJECTED:
        imageName = 'rejected-01';
        shadowColor = AppColors.redColor;
        break;
      case MessageType.SUCCESS:
        imageName = 'success';
        shadowColor = AppColors.greenColor;
        break;
      case MessageType.WARNING:
        imageName = 'warning';
        shadowColor = AppColors.redColor;
        break;
      case MessageType.INFO:
        imageName = 'info';
        shadowColor = AppColors.mainOrangeColor;
        break;
      default:
        imageName = 'info';
        shadowColor = AppColors.mainOrangeColor;
    }
    BotToast.showCustomText(
        duration: const Duration(seconds: 2),
        toastBuilder: (value) {
          return Container(
            width: width * 0.75,
            height: width * 0.55,
            decoration: BoxDecoration(
                color: AppColors.mainWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: width * 0.05),
                  SvgPicture.asset('assets/images/$imageName.svg',
                      width: width * 0.12, height: width * 0.12),
                  SizedBox(height: width * 0.05),
                  CustomText(text: message, fontsize: fontsize ?? width * 0.06,isTextAlign: TextAlign.center,),
                  SizedBox(height: width * 0.06),
                ]),
          );
        });
  }
}
