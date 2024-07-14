import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

Future<void> main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred device orientations
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  // Get the instance of SharedPreferences
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // Retrieve the theme preference
  var isDarkTheme = prefs.getBool("darkTheme") ?? false;

  // Run the app with the theme provider
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (BuildContext context) => ThemeProvider(isDarkTheme),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, value, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Majlisu ahlu noorullah',
          theme: value.getTheme(),
          home: HomePage(),
        );
      },
    );
  }
}
