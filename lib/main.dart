import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tablet/Database/Hive.dart';
import 'package:tablet/Database/models/DurationAdapter.dart';
import 'package:tablet/Database/models/Notify.dart';
import 'package:tablet/Database/models/NotifyType.dart';
import 'package:tablet/Database/models/TodoType.dart';
import 'package:tablet/Database/models/User.dart';
import 'package:tablet/Database/models/gender.dart';
import 'package:tablet/Database/models/todo.dart';
import 'package:tablet/Getx/Controller.dart';
import 'package:tablet/Routes.dart';
import 'package:tablet/screens/launchScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final documentdir = await getApplicationDocumentsDirectory();
  await Alarm.init();
  Hive
    ..init(documentdir.path)
    ..registerAdapter(UserAdapter())
    ..registerAdapter(TodoAdapter())
    ..registerAdapter(NotifyAdapter())
    ..registerAdapter(GenderAdapter())
    ..registerAdapter(TimeOfDayAdapter())
    ..registerAdapter(DurationAdapter())
    ..registerAdapter(NotifyTypeAdapter())
    ..registerAdapter(TodoTypeAdapter());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initialRoute = '/launchScreen';
  bool isUser = false;
  void initState() {
    check();
  }

  void check() async {
    Box userBox = await HiveData().getHiveBox('User');
    if (userBox.isNotEmpty) {
      Get.offAllNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        getPages: routes(),
        initialRoute: initialRoute,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSeed(seedColor: Color.fromRGBO(109, 49, 237, 0)),
          useMaterial3: true,
        ),
        home: LaunchScreen());
  }
}
