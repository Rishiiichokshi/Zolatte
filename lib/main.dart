import 'package:flutter/material.dart';
import 'package:zolatte/widgets/tabBarPage.dart';
import 'package:firebase_core/firebase_core.dart';
import './screens/retrieveDataPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: TabBarPage(),
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
    );
  }
}
