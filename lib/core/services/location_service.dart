// import 'dart:io';

// import 'package:bot_toast/bot_toast.dart';
// import 'package:flutter/services.dart';
// import 'package:template/app/app_config.dart';
// import 'package:template/ui/shared/colors.dart';
// import 'package:template/ui/shared/custom_widgets/custom_button.dart';
// import 'package:geocoding/geocoding.dart' as geo;
// import 'package:get/get.dart';
// // import 'package:location/location.dart';

// import '../../ui/shared/utils.dart';

// class LocationService {
//   late Location location;

//   LocationService() {
//     location = Location();
//     checkLocationPermission();
//   }
//   Future<void> checkLocationPermission() async {
//     await isLocationEnabeld()
//         ? (await isPermissionGranted()
//             ? Get.back()
//             : Get.defaultDialog(
//                 middleText:
//                     "If we do not get the permission of the Location, we will not be able to complete",
//                 confirm: CustomButton(
//                     backgroundColor: AppColors.greenColor,
//                     onPressed: () async {
//                       await isPermissionGranted()
//                           ? Get.back()
//                           : SystemNavigator.pop();
//                     },
//                     text: "grant",
//                     textColor: AppColors.mainWhiteColor,
//                     paddingLR: width * 0.01),
//                 cancel: CustomButton(
//                     backgroundColor: AppColors.redColor,
//                     onPressed: () {
//                       exit(0);
//                       // SystemNavigator.pop();
//                     },
//                     text: "deny",
//                     textColor: AppColors.mainWhiteColor,
//                     paddingLR: width * 0.01)))
//         : Get.defaultDialog(
//             middleText:
//                 "If we do not get grants to the Location, we will not be able to complete",
//             confirm: CustomButton(
//                 backgroundColor: AppColors.greenColor,
//                 onPressed: () async {
//                   Get.back();
//                   await isLocationEnabeld()
//                       ? Get.back()
//                       : SystemNavigator.pop();
//                 },
//                 text: "grant",
//                 textColor: AppColors.mainWhiteColor,
//                 paddingLR: width * 0.01),
//             cancel: CustomButton(
//                 backgroundColor: AppColors.redColor,
//                 onPressed: () {
//                   exit(1);
//                   //  SystemNavigator.pop();
//                 },
//                 text: "deny",
//                 textColor: AppColors.mainWhiteColor,
//                 paddingLR: width * 0.01));
//   }

//   Future<LocationData?> getUserCurrentLocation({bool hideLoader = true}) async {
//     LocationData locationData;

//     if (!await isLocationEnabeld()) return null;

//     if (!await isPermissionGranted()) return null;

//     customLoader();

//     locationData = await location.getLocation();

//     if (hideLoader) BotToast.closeAllLoading();

//     return locationData;
//   }

//   Future<geo.Placemark?> getAddressInfo(LocationData locationData,
//       {bool showLoader = true}) async {
//     if (showLoader) customLoader();
//     List<geo.Placemark> placemarks;
//     try {
//       placemarks = await geo.placemarkFromCoordinates(
//           locationData.latitude ?? 0.1, locationData.longitude ?? 0.1);
//     } catch (e) {
//       BotToast.closeAllLoading();
//       return null;
//     }

//     BotToast.closeAllLoading();

//     if (placemarks.isNotEmpty) {
//       return placemarks[0];
//     } else {
//       return null;
//     }
//   }

//   Future<geo.Placemark?> getCurrentAddressInfo() async {
//     return await getAddressInfo(
//         await getUserCurrentLocation(hideLoader: false) ??
//             LocationData.fromMap({}),
//         showLoader: false);
//   }

//   Future<bool> isLocationEnabeld() async {
//     bool serviceEnabled;
//     serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       serviceEnabled = await location.requestService();
//       if (!serviceEnabled) {
//         if (AppConfig.isLocationRequired) {
//           //!-- Message to show --
//           // Get.defaultDialog(
//           //     middleText:
//           //         "If we do not get the permission of the site, we will not be able to complete",
//           //     confirm: CustomButton(
//           //         onPressed: () {
//           //           Get.back();
//           //         },
//           //         text: "grant",
//           //         textColor: AppColors.mainWhiteColor,
//           //         paddingLR: width * 0.01),
//           //     cancel: CustomButton(
//           //         onPressed: () {
//           //           SystemNavigator.pop();
//           //         },
//           //         text: "deny",
//           //         textColor: AppColors.mainWhiteColor,
//           //         paddingLR: width * 0.01));
//         }

//         return false;
//       }
//     }
//     return serviceEnabled;
//   }

//   Future<bool> isPermissionGranted() async {
//     PermissionStatus permissionGranted;

//     permissionGranted = await location.hasPermission();
//     if (permissionGranted == PermissionStatus.denied) {
//       permissionGranted = await location.requestPermission();
//       if (permissionGranted != PermissionStatus.granted) {
//         if (AppConfig.isLocationRequired) {
//           //!-- Message to show --
//         }
//         return false;
//       }
//     }

//     return permissionGranted == PermissionStatus.granted;
//   }
// }









//   // late Location location;
//   // late LocationData locationData;
//   // late bool serviceEnabled;
//   // late PermissionStatus permissionGranted;

//   // LocationService() {
//   //   location = Location();
//   //   setLocation();
//   // }

//   // Future<void> setLocation() async {
//   //   serviceEnabled = await location.serviceEnabled();
//   //   if (!serviceEnabled) {
//   //     serviceEnabled = await location.requestService();
//   //     if (!serviceEnabled) {
//   //       return;
//   //     }
//   //   }

//   //   permissionGranted = await location.hasPermission();
//   //   if (permissionGranted == PermissionStatus.denied) {
//   //     permissionGranted = await location.requestPermission();
//   //     if (permissionGranted != PermissionStatus.granted) {
//   //       return;
//   //     }
//   //   }

//   //   locationData = await location.getLocation();
//   // }

//   // Future<List> getUserCurrentLocation() async {
//   //   List locationDatalist = [];
//   //   locationDatalist.add(locationData.latitude);
//   //   locationDatalist.add(locationData.longitude);
//   //   return locationDatalist;
//   // }

//   // Future<List> getAddressInfo() async {
//   //   List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
//   //       locationData.latitude ?? 0.0, locationData.longitude ?? 0.0);
//   //   if (placemarks.isEmpty) {
//   //     return;
//   //   }
//   //   return placemarks;
//   // }

//   // Future<bool> isLocationEnable()async {
    

//   // }