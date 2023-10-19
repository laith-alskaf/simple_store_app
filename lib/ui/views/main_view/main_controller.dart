import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_challenge/core/enums/bottom_navigation.dart';

class MainController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final drawerKey = GlobalKey<DrawerControllerState>();
  RxInt lengthList = 0.obs;
  RxInt currentIndex = 1.obs;
  var selected = BottomNavigationEnum.HOMEVIEW.obs;
  PageController pageViewController = PageController(initialPage: 1);
  void animatedToPage(selectedEnum, pageNumber) {
    pageNumber;

    pageViewController.animateToPage(
      pageNumber,
      duration: const Duration(
        microseconds: 500,
      ),
      curve: Curves.easeInCirc,
    );

    selected.value = selectedEnum;
  }
}
