import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:menu_maker/controller/central_state.dart';
import 'package:menu_maker/controller/setup.dart';
import 'package:menu_maker/pages.dart';
import 'package:menu_maker/theme/theme.dart';

void main()  async {

  await initDependencies();
  setupState();
  _setupOrientation();
  runApp(const MyApp());
}
initDependencies()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends GetView<CentralState> {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "MENU",
      getPages: appPages,
      initialRoute: initialRoute,
      theme: controller.appTheme,
      themeMode: ThemeMode.light,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      debugShowCheckedModeBanner: kDebugMode,
    );
  }
}

_setupOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}
