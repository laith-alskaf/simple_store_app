import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:store_challenge/ui/shared/colors.dart';
import 'package:get/get.dart';

//~  --- Width , Height for Screen-Size  ---

double get width => Get.width;
double get height => Get.height;

double screenWidth(double percent) {
  return Get.width / percent;
}

double screenHieght(double percent) {
  return Get.height / percent;
}


void customLoader() => BotToast.showCustomLoading(toastBuilder: (context) {
      return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        width: width * 0.2,
        height: width * 0.2,
        child: SpinKitCircle(
          color: AppColors.mainPurple1,
          size: width * 0.2,
        ),
      );
    });
