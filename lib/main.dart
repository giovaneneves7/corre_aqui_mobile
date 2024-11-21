import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';
import 'package:corre_aqui/features/splash/screens/post_splash_screen.dart';
import 'package:corre_aqui/theme/custom_theme.dart';
import 'package:corre_aqui/helper/route_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
      
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      getPages: RouteHelper.routes,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: PostSplashScreen(), 
    );
  }

}
