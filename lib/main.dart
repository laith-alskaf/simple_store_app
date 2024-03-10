import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:LaithStore/app/my_app.dart';
import 'package:LaithStore/app/my_app_controller.dart';
import 'package:LaithStore/core/data/repositories/shared_preference_repositories.dart';
import 'package:LaithStore/core/services/cart_servces/cart_service.dart';
import 'package:LaithStore/ui/views/main_view/home_view/home_view_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.put(SharedPreferenceRepositories());
  Get.put(CartServices());
  Get.put(MyAppController());
  Get.put(HomeViewController());

  runApp(const MyApp());
}
