import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:store_challenge/app/my_app.dart';
import 'package:store_challenge/app/my_app_controller.dart';
import 'package:store_challenge/core/data/repositories/shared_preference_repositories.dart';
import 'package:store_challenge/core/services/cart_servces/cart_service.dart';
import 'package:store_challenge/ui/views/main_view/home_view/home_view_controller.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  });
  Get.put(SharedPreferenceRepositories());
  Get.put(CartServices());
  // Get.put(ConnectivityService());
  Get.put(MyAppController());
  Get.put(HomeViewController());
  runApp(const MyApp());
}




