import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_challenge/ui/views/main_view/main_view.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
        defaultTransition: Transition.circularReveal,
        transitionDuration: const Duration(milliseconds: 12),
        title: 'Flutter Demo',
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Alexandria-Regular',
          primarySwatch: Colors.blue,
        ),
        home:const MainView());
  }
}

