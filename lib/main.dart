import 'package:crud/class/theme.dart';
import 'package:crud/pages/bottom.dart';
import 'package:crud/pages/create.dart';
import 'package:crud/pages/lock2.dart';
import 'package:crud/pages/stackbuilder.dart';
import 'package:crud/pages/test.dart';
import 'package:crud/pages/themeswitch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter firebase demo',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeNotifier>(context).currentTheme,
      home: check(),
    );
  }
}
