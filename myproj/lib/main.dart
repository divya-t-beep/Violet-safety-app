import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproj/child/bottom_screens/child_home_page.dart';
//import 'package:myproj/child/bottomflut_screens/child_home_page.dart';
import 'package:myproj/child/child_login_screen.dart';
import 'package:myproj/parent/parent_home_screen.dart';
import 'package:myproj/utils/constants.dart';

import 'child/bottom_page.dart';
import 'db/share_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await MySharedPrefference.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.firaSansTextTheme(
            Theme.of(context).textTheme,
          ),
          primarySwatch: Colors.blue,
        ),
        home: LoginScreen());
  }
}
