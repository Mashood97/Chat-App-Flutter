import 'package:chat_app/providers/login_provider.dart';
import 'package:chat_app/screens/home_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/utils/pref_util.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'utils/configs.dart' as config;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SharedPrefs.instance.init();
    init(
      config.APP_ID,
      config.AUTH_KEY,
      config.AUTH_SECRET,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Chat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.red,
          accentColor: Colors.deepOrangeAccent,
          canvasColor: Colors.white,
          textTheme: TextTheme(
            headline6: GoogleFonts.robotoCondensed(
              color: Colors.white,
              fontSize: 16.0,
            ),
            headline5: GoogleFonts.robotoCondensed(
              color: Colors.black,
              fontSize: 20.0,
            ),
            headline4: GoogleFonts.robotoCondensed(
              color: Colors.black,
              fontSize: 24.0,
            ),
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.deepOrangeAccent,
            padding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        routes: {
          '/': (ctx) => LoginScreen(),
          HomeScreen.routeNamed: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
