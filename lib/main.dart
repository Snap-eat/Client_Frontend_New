// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snapeat1/component/navigator_key.dart';
import 'package:snapeat1/prefrences/shared_prefrences.dart';
import 'package:snapeat1/screens/splash_screen/splash_screen.dart';
import 'package:snapeat1/utils/colors.dart';
import 'component/text_constant_key.dart';
import 'provider/home_screen_provider.dart';
import 'services/auth_services/onboarding_api.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preference.pref = await SharedPreferences.getInstance();
  // use while  DeviceOrienntaion
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  // statusbar color & appbar color same
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarBrightness: Brightness.light, statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [ChangeNotifierProvider<home_screen_provider>(create: (context) => home_screen_provider()), ChangeNotifierProvider<onboarding_api>(create: (context) => onboarding_api())],
        child: MaterialApp(
          navigatorKey: navigation_service.navigatorKey,
          debugShowCheckedModeBanner: false,
          title: SNAPEAT_CLIENT,
          theme: ThemeData(
            primaryColor: black,
          ),
          home: splash_screen(),
        ));
  }
}
