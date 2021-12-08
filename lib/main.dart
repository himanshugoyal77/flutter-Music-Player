import 'package:flutter/material.dart';
import 'package:flutter_application_1/admob.dart';
import 'package:flutter_application_1/audio_file.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import 'app_colors.dart' as AppColors;
import 'package:flutter_application_1/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(initFuture);
  runApp(Provider.value(
    value: adState,
    builder: (context, child) => MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late BannerAd bannerAd;
  bool isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime Music Player',
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(primarySwatch: Colors.blue, brightness: Brightness.light),
      darkTheme:
          ThemeData(primaryColor: Colors.red, brightness: Brightness.dark),
      themeMode: ThemeMode.light,
      home: MyHomePage(),
    );
  }
}
