import 'package:get/get.dart';
import 'package:tablet/Widget/UserDrawer.dart';
import 'package:tablet/screens/Home.dart';
import 'package:tablet/screens/UserScreen.dart';
import 'package:tablet/screens/launchScreen.dart';

routes() => [
      GetPage(
        name: '/launchScreen',
        page: () => LaunchScreen(),
      ),
      GetPage(name: '/home', page: () => Home(), transition: Transition.zoom),
      GetPage(
          name: '/userScreen',
          page: () => UserScreen(),
          transition: Transition.rightToLeftWithFade),
      GetPage(
          name: '/userDrawer',
          page: () => UserDrawer(),
          transition: Transition.rightToLeftWithFade)
    ];
