import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/utils/routes.dart';
import 'package:flutter_application_1/pages/utils/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: Mytheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      darkTheme: Mytheme.darkheme(context),
      initialRoute: MyRoutes.HomeRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => Homepage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
